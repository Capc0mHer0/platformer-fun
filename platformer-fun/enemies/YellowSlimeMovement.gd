extends SlimeMovement
class_name YellowSlime

func _physics_process(_delta: float) -> void:
	velocity.x = -70
	move_and_slide()
	super(_delta)

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	kill_Slime(body)
