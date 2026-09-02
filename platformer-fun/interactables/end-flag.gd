extends Area2D

var levelComplete: PackedScene = preload("res://gui/level-complete.tscn")
var hasCompleted: bool = false

func _on_body_entered(body: Node2D) -> void:
	if body is Player and not hasCompleted:
		hasCompleted = true
		$CompleteSound.play()
		# in perfect world we load the scene while waiting for the sound to
		# finish playing
		await $CompleteSound.finished
		GameDataManager.update_level_progress(SceneManager.getLevelIndex(), $Timer.time)
		get_tree().root.add_child(levelComplete.instantiate())
