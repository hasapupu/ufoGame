extends CharacterBody2D

class_name ufo

@onready var explosion: PackedScene = preload("res://explosion.tscn")
@onready var scoreMan = get_parent().get_parent().get_node("RichTextLabel") as scoreScript
@onready var bullet: PackedScene = preload("res://enemyBullet.tscn")
var player: playerScript
var limit := false

func _physics_process(delta):
    move_and_slide()

func shoot():
    print("unoverrided")

func _process(delta):
    if position.y <= 140 and limit == false:
        shoot()
        limit = true

func increaseScore():
    scoreMan.score += 20

#func playDeathSFX():
#    player.auPlay.stream = player.boom
#	player.auPlay.play()