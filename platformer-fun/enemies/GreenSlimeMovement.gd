extends SlimeMovement
class_name GreenSlime

func _physics_process(_delta: float) -> void:
	if is_on_floor():
		velocity.x = -70
	if not is_on_floor():
		velocity.y = gravity
	move_and_slide()
	super(_delta)
	
func _on_slime_hurt_box_body_entered(body: Node2D) -> void:
	kill_Slime(body)
