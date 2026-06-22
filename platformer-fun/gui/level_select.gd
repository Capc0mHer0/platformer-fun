extends Control
class_name LevelSelect

signal levels_back

@onready var levelButtonContainer: GridContainer = $LevelButtons

func _ready():
	for buttonContainer in levelButtonContainer.get_children():
		var button: Button = buttonContainer.get_child(0)
		if button.has_method("connect"):
			button.pressed.connect(on_level_button_pressed.bind(button.name))

func on_level_button_pressed(level: String) -> void:
	SceneManager.loadLevel(level.to_int())

func _on_back_button_pressed() -> void:
	levels_back.emit()
	self.queue_free()
