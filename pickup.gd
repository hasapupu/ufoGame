class_name pickup extends Area2D

@export var value: int = 0
var clipToPlay := "pipe"

func _on_body_entered(body):
	if body.is_in_group("player"):
		var player = body as playerScript
		player.anim.play(clipToPlay)
		player.currentWeapon = value
		queue_free()
