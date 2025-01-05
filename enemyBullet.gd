extends RayCast2D

class_name enemyBullet

@onready var gm: gameManager = get_tree().get_root().get_node("Node")

func _process(delta):
    if is_colliding():
        if get_collider().is_in_group("player"):
            gm.loadPremadeScene(gm.over)