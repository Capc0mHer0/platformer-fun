extends Area2D

func _on_body_entered(body: Node2D) -> void:
	body.obtain_sword()
	MusicPlayer.play_slime_king_theme()
	queue_free()
