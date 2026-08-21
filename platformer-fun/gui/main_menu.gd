extends Control

@export var settingsScene: PackedScene
@export var levelSelectScene: PackedScene

func _ready() -> void:
	MusicPlayer.stop()
	MusicPlayer.play_level_songs()


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_1.tscn")

func _on_settings_button_pressed() -> void:
	self.visible = false
	var scene: Settings = settingsScene.instantiate()
	scene.settings_closed.connect(make_visible)
	get_tree().root.add_child(scene)
	
func _on_level_select_button_pressed():
	self.visible = false
	var scene: LevelSelect = levelSelectScene.instantiate()
	scene.levels_back.connect(make_visible)
	get_tree().root.add_child(scene)

func _on_end_game_pressed() -> void:
	get_tree().quit()

func make_visible() -> void:
	self.visible = true
