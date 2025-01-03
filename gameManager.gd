extends Node
class_name gameManager 

@onready var gameLoop: PackedScene = preload("res://mainScene.tscn")
@onready var menu: PackedScene = preload("res://mainMenu.tscn")
@onready var over: PackedScene = preload("res://gameOver.tscn")

var currentScene: Node

func _ready():
    loadPremadeScene(menu)

func loadPremadeScene(sceneToLoad: PackedScene):
    for i in get_children():
        print("online")
        i.queue_free()
    currentScene = sceneToLoad.instantiate()
    add_child(currentScene)