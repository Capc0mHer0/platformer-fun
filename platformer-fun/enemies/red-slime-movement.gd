extends SlimeMovement
class_name RedSlime

func _physics_process(_delta: float) -> void:
	if is_on_wall():
		flip_direction()
	if is_on_floor():
		velocity.x = speed
	if not is_on_floor():
		velocity.y = gravity
	move_and_slide()
	super(_delta)

func _on_area_2d_body_entered(body: Node2D) -> void:
	kill_Slime(body)

func flip_direction() -> void:
	$RedSlime.flip_h = !$RedSlime.flip_h
	speed *= -1
	$RayCast2D.target_position.x *= -1
