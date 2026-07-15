extends SlimeMovement

class_name YellowSlime

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	kill_Slime(body)
