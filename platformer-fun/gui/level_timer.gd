extends CanvasLayer
class_name LevelTimer

@onready var clock: RichTextLabel = $Timer/Clock

var time: float = 0

func _process(delta: float) -> void:
	time += delta
	clock.text = "%.3f" % time
