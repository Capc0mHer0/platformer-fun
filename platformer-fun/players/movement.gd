extends CharacterBody2D
class_name Player
# This is for player movement  
# Player shold be able to move and sprint accordingly

@export var backgroundImage: Texture2D
@export var speed: int = 400
@export var sprintMultiplier: float = 1.5 
@export var jumpHeight: int = 400
@export var gravity: int = 1300
@onready var background: Sprite2D = $Camera2D/Ice
var playerSpawn: Vector2 = Vector2.ZERO
var isSprinting: bool = false 
var playerInput: Vector2 = Vector2.ZERO

func _ready():
	playerSpawn = position
	background.texture = backgroundImage

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
		playerVelocity.y = gravity * delta
	else:
		playerVelocity.y = playerInput.y * jumpHeight

	if Input.is_action_just_pressed("sprint"):
		isSprinting = !isSprinting

	playerVelocity.x = playerVelocity.x * speed
	if isSprinting:
		playerVelocity.x *= sprintMultiplier
	velocity.x = move_toward(velocity.x, playerVelocity.x, delta*10000)
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

func launch(launchVelocity: int = -550):
	velocity.y = launchVelocity


func _on_player_hurt_box_body_entered(body: Node2D) -> void:
	if body is SlimeMovement and not body.is_dead:
		return
	killPlayer()
