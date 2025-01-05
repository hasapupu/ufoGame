class_name playerScript extends CharacterBody2D



@export var speed = 250
@onready var gm: gameManager = get_tree().get_root().get_node("Node")
@onready var bullet: PackedScene = preload("res://playerBullet.tscn")
@onready var pipeSwing: PackedScene = preload("res://swing.tscn")
var currentWeapon = wieldedWeapon.NONE
var enumDict = {wieldedWeapon.PIPE: pipeShoot, wieldedWeapon.SHOTGUN: shotgunShoot,wieldedWeapon.MACHINEGUN: machineShoot}

enum wieldedWeapon{
    PIPE = 0,
    SHOTGUN = 1,
    MACHINEGUN = 2,
    NONE = 3,
}


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
        print("collided")
        if collider.is_in_group("damaging"):
            gm.loadPremadeScene(gm.over)

func _process(delta):
    if Input.is_action_just_pressed("shoot"):
        if currentWeapon == wieldedWeapon.SHOTGUN:
            shotgunShoot()
        elif currentWeapon == wieldedWeapon.MACHINEGUN:
            machineShoot()
        elif currentWeapon == wieldedWeapon.PIPE:
            
            pipeShoot()
        
func shotgunShoot():
    currentWeapon = wieldedWeapon.NONE
    var newBullet = []
    for i in range(3):
        newBullet.append(bullet.instantiate() as CharacterBody2D)
    
    for i in range(3):
        newBullet[i].position = Vector2(position.x,position.y)
        newBullet[i].velocity = (Vector2(0,1)).normalized().rotated(20 * (i - 1)) * 550
        get_parent().add_child(newBullet[i])
    

func pipeShoot():
    currentWeapon = wieldedWeapon.NONE
    var swingInst: Node2D = pipeSwing.instantiate()
    add_child(swingInst)
    print(swingInst)
    await get_tree().create_timer(0.3).timeout
    swingInst.queue_free()

func machineShoot():
    currentWeapon = wieldedWeapon.NONE
    var newBullet = []
    for i in range(12):
        newBullet.append(bullet.instantiate() as CharacterBody2D)
    
    for i in range(12):
        print(i)
        newBullet[i].position = Vector2(position.x,position.y)
        newBullet[i].velocity = Vector2(0,1) * 550
        get_parent().add_child(newBullet[i])
        await get_tree().create_timer(0.1).timeout
    

func currentShoot():
    pass