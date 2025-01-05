extends RayCast2D

func _process(delta):
    if is_colliding():
        if get_collider().is_in_group("damaging"):
            get_collider().queue_free()