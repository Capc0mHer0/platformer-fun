extends CharacterBody2D
class_name Player
# This is for player movement  
# Player shold be able to move and sprint accordingly

@export var speed: int = 400
@export var sprintMultiplier: float = 1.5 
@export var jumpHeight: int = 500
@export var gravity: int = 35
var playerSpawn: Vector2 = Vector2.ZERO
var isSprinting: bool = false 
var playerInput: Vector2 = Vector2.ZERO

func _ready():
	playerSpawn = position

func _process(delta: float) -> void:
	movement(delta)

func _unhandled_input(_event: InputEvent) -> void:
	playerInput = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		playerInput.x = 1
	if Input.is_action_pressed("move_left"):
		playerInput.x = -1
	if Input.is_action_pressed("move_up") and is_on_floor():
		$JumpSound.play()
		playerInput.y = -1
	else:
		playerInput.y = 0

func movement(delta: float) -> void:
	var playerVelocity: Vector2 = playerInput
	if not is_on_floor():
		playerVelocity.y = gravity
	else:
		playerVelocity.y = playerInput.y * jumpHeight

	if Input.is_action_just_pressed("sprint"):
		isSprinting = !isSprinting

	if playerVelocity.length() > 0:
		playerVelocity.x = playerVelocity.x * speed
		if isSprinting:
			playerVelocity.x *= sprintMultiplier
		position.x += playerVelocity.x * delta
		velocity.y += playerVelocity.y
	move_and_slide()
	checkForFallDeath()
	checkFacingDirection()

func checkForFallDeath():
	if position.y >= 50:
		killPlayer()

func checkFacingDirection():
	if Input.is_action_pressed("move_left"):
		$character.flip_h = true
	if Input.is_action_pressed("move_right"):
		$character.flip_h = false
	
func killPlayer(): 
	DeathSoundPlayer.play()
	SceneManager.call_deferred("restartLevel")

func launch(launchVelocity: int = -700):
	velocity.y = launchVelocity


func _on_player_hurt_box_body_entered(_body: Node2D) -> void:
	killPlayer()
