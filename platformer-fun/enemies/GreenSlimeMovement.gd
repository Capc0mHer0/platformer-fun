extends SlimeMovement
class_name GreenSlime

func _physics_process(delta: float) -> void:
	if is_on_wall():
		$GreenSlime.flip_h = !$GreenSlime.flip_h
		speed *= -1
	if is_on_floor():
		velocity.x = speed
	if not is_on_floor():
		velocity.y = gravity
	move_and_slide()
	super(delta)
	
func _on_slime_hurt_box_body_entered(body: Node2D) -> void:
	kill_Slime(body)
