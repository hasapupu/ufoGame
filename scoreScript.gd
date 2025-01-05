extends RichTextLabel

@export var score: int = 0
var currentText := "Score: "

func _on_timer_timeout():
    score = score + 1
    currentText = "Score: " + str(score)

func _process(delta):
    text = currentText