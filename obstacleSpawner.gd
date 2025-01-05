class_name obstacleSpawner extends Node2D
 
@export var UFO: PackedScene
@onready var machineGunUfo: PackedScene = preload("res://machineGunUfo.tscn")
@onready var defUFO: PackedScene = preload("res://defaultUfo.tscn")
@export var timeUntilSpawn: float = 5
@onready var timer = get_node("Timer")
@onready var secTimerr = get_node("Timer2")
@onready var player: CharacterBody2D = get_parent().get_node("player")
var rawValues = [0,1,2]
@export var fallDownObjects: Array[PackedScene]


func _ready():
	UFO = preload("res://ufo.tscn")
	recursiveSpawn()

func recursiveSpawn():
	timer.wait_time = timeUntilSpawn
	timer.start()

func _timeout():
	if timeUntilSpawn > 1:
		timeUntilSpawn = timeUntilSpawn - 0.03
	var randNum = rawValues.pick_random()
	var currentUfo: ufo
	if randNum == 0:
		currentUfo = UFO.instantiate()
	elif randNum == 1:
		currentUfo = machineGunUfo.instantiate()
	elif randNum == 2:
		currentUfo = defUFO.instantiate()
	currentUfo.player = player
	currentUfo.position = Vector2(randf_range(-400,400),300)
	var angle = currentUfo.get_angle_to(player.position)
	add_child(currentUfo)
	currentUfo.velocity = Vector2(player.position - currentUfo.position) / 1.5
	recursiveSpawn()

func _timeout_sec():
	var currentFall: CharacterBody2D = fallDownObjects.pick_random().instantiate()
	currentFall.position = Vector2(randf_range(-200,200), -150)
	currentFall.velocity = Vector2(0,1) * 450
	add_child(currentFall) 
