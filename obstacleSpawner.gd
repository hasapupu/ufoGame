extends Node2D
 
@export var ufo: PackedScene
@export var timeUntilSpawn: float = 5
@onready var timer = get_node("Timer")
@onready var player: CharacterBody2D = get_parent().get_node("player")

func _ready():
	ufo = preload("res://ufo.tscn")
	recursiveSpawn()

func recursiveSpawn():
	timer.wait_time = timeUntilSpawn
	timer.start()

func _timeout():
	timeUntilSpawn = timeUntilSpawn - 0.03
	var currentUfo: CharacterBody2D = ufo.instantiate() 
	currentUfo.position = Vector2(randf_range(-400,400),300)
	var angle = currentUfo.get_angle_to(player.position)
	
	add_child(currentUfo)
	currentUfo.velocity = Vector2(player.position - currentUfo.position) / 2
	recursiveSpawn()
