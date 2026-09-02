extends Control
class_name LevelSelect

signal levels_back

@onready var levelButtonContainer: GridContainer = $LevelButtons

func _ready():
	var levelIndex: int = 0
	for buttonContainer in levelButtonContainer.get_children():
		var button: Button = buttonContainer.get_child(0)
		if levelIndex != 0:
			var previousLevel: LevelData = GameDataManager.get_level_save_data(levelIndex-1)
			if previousLevel == null:
				button.disabled = true
		var currentData: LevelData = GameDataManager.get_level_save_data(levelIndex)
		if currentData != null:
			button.get_child(0).text = "%.3f" % currentData.fastest_complete
		if button.has_method("connect"):
			button.pressed.connect(on_level_button_pressed.bind(button.name))
		levelIndex += 1

func on_level_button_pressed(level: String) -> void:
	SceneManager.loadLevel(level.to_int())
	self.queue_free()

func _on_back_button_pressed() -> void:
	levels_back.emit()
	self.queue_free()
