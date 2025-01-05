extends ufo

@onready var pickUp: PackedScene = preload("res://shotGunPickup.tscn")

func shoot():
    var newBullet = []
    for i in range(3):
        newBullet.append(bullet.instantiate() as CharacterBody2D)
    
    for i in range(3):
        newBullet[i].position = Vector2(position.x,position.y)
        newBullet[i].velocity = (Vector2(0,-1)).normalized().rotated(20 * (i - 1)) * 550
        get_parent().add_child(newBullet[i])

func _on_tree_exiting():
    print(pickUp)
    var pickinst: pickup = pickUp.instantiate()
    pickinst.value = 1
    pickinst.position = position
    print(pickinst)
    var pleasework = pickinst
    get_parent().add_child.call_deferred(pleasework)