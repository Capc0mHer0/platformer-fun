extends CharacterBody2D
class_name PurpleSlime

@export var gravity: int = 50

func _physics_process(_delta: float) -> void:
	if is_on_floor():
		position.x -= 1
	if not is_on_floor():
		velocity.y = gravity
	move_and_slide()

func kill_Purple_Slime():
	self.queue_free()

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	kill_Purple_Slime()
