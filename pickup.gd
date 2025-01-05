class_name pickup extends Area2D

@export var value: int 

func _on_body_entered(body):
	if body.is_in_group("player"):
		var player = body as playerScript
		player.currentWeapon = value
		queue_free()
