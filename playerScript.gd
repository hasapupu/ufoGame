extends CharacterBody2D

@export var speed = 250


func getInput():
    var inputDirection = Input.get_vector("left","right","up","down")

    velocity = inputDirection * speed

func _physics_process(delta):
    getInput()
    move_and_slide()

    if(position.x > 195):
        position.x = 195

    if(position.x < -195):
        position.x = -195

    if(position.y > 118):
        position.x = 118

    if(position.y < -118):
        position.y = -118
    
    for i in get_slide_collision_count():
        var collision = get_slide_collision(i)
        var collider = collision.get_collider()
        if collider.is_in_group("damaging"):
            print("hit")

