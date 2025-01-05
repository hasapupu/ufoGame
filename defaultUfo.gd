class_name defaultUfo extends ufo

@onready var pickUp: PackedScene = preload("res://pipePickUp.tscn")

func _on_tree_exiting():
    var pickinst: pickup = pickUp.instantiate()
    pickinst.value = 0
    pickinst.position = position
    print(pickinst)
    var pleasework = pickinst
    get_parent().add_child.call_deferred(pleasework)
