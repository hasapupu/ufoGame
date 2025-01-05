class_name machineGunUfo extends ufo

@onready var pickUp: PackedScene = preload("res://machineGunPickup.tscn")

func shoot():
	var newBullet = []
	for i in range(12):
		newBullet.append(bullet.instantiate() as CharacterBody2D)
	
	for i in range(12):
		print(i)
		newBullet[i].position = Vector2(position.x,position.y)
		newBullet[i].velocity = Vector2(0,-1) * 550
		get_parent().add_child(newBullet[i])
		await get_tree().create_timer(0.2).timeout

func _on_tree_exiting():
	increaseScore()
	player.auPlay.stream = player.boom
	player.auPlay.play()
	var expInst: GPUParticles2D = explosion.instantiate()
	expInst.emitting = true
	expInst.position = position
	get_parent().add_child.call_deferred(expInst)
	print(pickUp)
	var pickinst: pickup = pickUp.instantiate()
	pickinst.value = 2
	pickinst.clipToPlay = "machineGun"
	pickinst.position = position
	print(pickinst)
	var pleasework = pickinst
	get_parent().add_child.call_deferred(pleasework)
