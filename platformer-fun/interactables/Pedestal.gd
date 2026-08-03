extends Area2D




func _on_body_entered(body: Node2D) -> void:
	body.obtain_sword()
	queue_free()

	
	
