extends Node2D
class_name Sword

var timer = 0
var animation_time := 0.2 
var swing_lag := 0.2 + animation_time

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("swing_sword") and visible and timer <= 0:
		swing_sword()

func toggle_sword():
	visible = !visible

func _process(delta: float) -> void:
	reduceSwordSwingTimer(delta)

func reset_sword():
	rotation = 0
	$Area2D/CollisionShape2D.set_deferred("disabled", true)

func reduceSwordSwingTimer(delta):
	if timer > 0: 
		timer -= delta
		
func swing_sword():
	$Area2D/CollisionShape2D.set_deferred("disabled", false)
	timer = swing_lag
	var swing := deg_to_rad(90)
	var tween: Tween = create_tween()
	tween.tween_property(self, "rotation", swing, animation_time)
	tween.finished.connect(reset_sword)
	
