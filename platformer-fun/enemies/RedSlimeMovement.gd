extends SlimeMovement
class_name RedSlime

func _physics_process(_delta: float) -> void:
	if is_on_floor():
		position.x -= 2
	if not is_on_floor():
		velocity.y = gravity
	move_and_slide()
	super(_delta)




func _on_area_2d_body_entered(body: Node2D) -> void:
	kill_Slime(body)
