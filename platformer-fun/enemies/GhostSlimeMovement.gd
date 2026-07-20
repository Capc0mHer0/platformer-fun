extends SlimeMovement
class_name GhostSlime

var onscreen = 'false'

func _physics_process(_delta: float) -> void:
	velocity.x = 0
	if onscreen == 'true':
		velocity.x = speed
	else:
		velocity.x = 0
	move_and_slide()
	super(_delta)

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	kill_Slime(body)


func _on_visible_on_screen_enabler_2d_screen_entered() -> void:
	onscreen = 'true'


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	onscreen = 'false'
