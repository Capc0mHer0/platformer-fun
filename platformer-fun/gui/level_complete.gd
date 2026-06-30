extends Control

func _enter_tree():
	get_tree().paused = true
	
func _exit_tree():
	get_tree().paused = false

func _on_restart_button_pressed():
	SceneManager.restartLevel()
	self.queue_free()

func _on_next_level_button_pressed():
	SceneManager.advanceToNextScene()
	self.queue_free()
