extends CanvasLayer

func _enter_tree():
	get_tree().paused = true
	
func _exit_tree():
	get_tree().paused = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.queue_free()

func _on_resume_pressed():
	self.queue_free()

func _on_retry_pressed():
	SceneManager.restartLevel()
	self.queue_free()

func _on_main_menu_pressed():
	SceneManager.goToMainMenu()
	self.queue_free()

func _on_end_game_pressed() -> void:
	get_tree().quit()
