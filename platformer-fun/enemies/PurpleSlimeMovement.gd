extends SlimeMovement
class_name PurpleSlime

@onready var player_node = $"../CharacterBody2D"
@onready var slime = $purple

var slimeCurrentFacing = "left"
func _physics_process(_delta: float) -> void:
	if is_on_floor():
		checkSlimeFacingDirection()
		checkForChase()
	if not is_on_floor():
		velocity.y = gravity
	move_and_slide()
	super(_delta)

func checkForChase():
	var playerFacing = grabPlayerFacing()
	if playerFacing == "left" and slimeCurrentFacing == "left":
		position.x -= 1
		$purple.play("awake")
	elif playerFacing == "right" and slimeCurrentFacing == "right":
		position.x += 1
		$purple.play("awake")
	else:
		$purple.play("asleep")
		
func checkSlimeFacingDirection():
	var playerFacing = grabPlayerFacing()
	if player_node.position.x > position.x and slimeCurrentFacing == "left":
		$purple.flip_h = true
		slimeCurrentFacing = "right"
	
	if player_node.position.x < position.x and slimeCurrentFacing == "right":
		$purple.flip_h = false
		slimeCurrentFacing = "left"
		
	return slimeCurrentFacing
	
## grabbing the facing direction from the player in movement.gd
func grabPlayerFacing():
	var currentfacing = player_node.checkFacingDirection()
	return currentfacing

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	kill_Slime(body)
