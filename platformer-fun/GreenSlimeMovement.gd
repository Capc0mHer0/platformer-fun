extends CharacterBody2D
class_name GreenSlime

@export var gravity: int = 50

func _physics_process(_delta: float) -> void:
	if is_on_floor():
		position.x -= 1
	if not is_on_floor():
		velocity.y = gravity
	move_and_slide()
