extends Control

@onready var gm: gameManager = get_parent()

func _on_button_button_down():
    gm.loadPremadeScene(gm.menu)