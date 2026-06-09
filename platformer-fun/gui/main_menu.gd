extends Control

@export var settingsScene: PackedScene

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_1.tscn")

func _on_settings_button_pressed() -> void:
	self.visible = false
	var settingsScene: Settings = settingsScene.instantiate()
	settingsScene.settings_closed.connect(make_visible)
	get_tree().root.add_child(settingsScene)

func _on_end_game_pressed() -> void:
	get_tree().quit()

func make_visible() -> void:
	self.visible = true
