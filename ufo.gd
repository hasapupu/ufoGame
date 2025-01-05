extends CharacterBody2D

class_name ufo


@onready var bullet: PackedScene = preload("res://enemyBullet.tscn")
var player: CharacterBody2D
var limit := false

func _physics_process(delta):
    move_and_slide()

func shoot():
    print("unoverrided")

func _process(delta):
    if position.y <= 140 and limit == false:
        shoot()
        limit = true

