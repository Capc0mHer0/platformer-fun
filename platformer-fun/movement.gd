extends CharacterBody2D
# This is for player movement  
# Player shold be able to move and sprint accordingly


@export var speed: int = 400 
@export var sprintMultiplier: float = 1.5 

var isSprinting: bool = false 
var playerInput: Vector2 = Vector2.ZERO 

func _process(delta: float) -> void:
	movement(delta)

func _unhandled_input(event: InputEvent) -> void:
	playerInput = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		playerInput.x = 1
	if Input.is_action_pressed("move_left"):
		playerInput.x = -1
	if Input.is_action_pressed("move_up") and is_on_floor():
		playerInput.y = -400

func movement(delta: float) -> void:
	var playerVelocity: Vector2 = playerInput
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
	if Input.is_action_just_pressed("sprint"):
		isSprinting = !isSprinting

	if playerVelocity.length() > 0:
		playerVelocity.x = playerVelocity.x * speed
		if isSprinting:
			playerVelocity.x *= sprintMultiplier
		position += playerVelocity * delta 
	move_and_slide()
