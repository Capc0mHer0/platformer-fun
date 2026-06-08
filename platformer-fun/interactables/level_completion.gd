extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		$CompleteSound.play()
		# in perfect world we load the scene while waiting for the sound to
		# finish playing
		await $CompleteSound.finished
		SceneManager.call_deferred("advanceToNextScene")
