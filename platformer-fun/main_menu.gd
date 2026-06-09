extends Control

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://levels/level_1.tscn")

func _on_settings_button_pressed():
	pass

func _on_end_game_pressed():
	get_tree().quit()
