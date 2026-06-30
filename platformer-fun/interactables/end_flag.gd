extends Area2D

var levelComplete: PackedScene = preload("res://gui/level_complete.tscn")

var hasCompleted: bool = false

func _on_body_entered(body: Node2D) -> void:
	if body is Player and not hasCompleted:
		hasCompleted = true
		$CompleteSound.play()
		# in perfect world we load the scene while waiting for the sound to
		# finish playing
		await $CompleteSound.finished
		
		get_tree().root.add_child(levelComplete.instantiate())
