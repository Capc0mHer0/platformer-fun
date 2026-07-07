extends SlimeMovement
class_name YellowSlime

func _physics_process(_delta: float) -> void:
	if is_on_floor():
		position.x -= 1
	if not is_on_floor():
		velocity.y = gravity
	move_and_slide()
	super(_delta)

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	kill_Slime()
