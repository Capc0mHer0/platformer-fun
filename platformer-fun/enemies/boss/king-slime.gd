extends CharacterBody2D

@onready var level9 = $".."
@onready var healthBar: HealthBar = $HealthBar
@export var maxHealth = 20
@export var speed = -100
@export var jumpHeight = -500
@export var gravity: int = 1300

var jumpTime: float = 4
var idleTime: float = 4
var actionTimer: float = idleTime
var isActive: bool = false
var health: int = maxHealth

var turnAroundCoolDown: float = 1
var turnAroundTimer: float = 0

func _process(delta: float) -> void:
	actionTimer -= delta
	turnAroundTimer -= delta
	if actionTimer <= 0:
		isActive = !isActive
		if isActive:
			actionTimer = jumpTime
		else:
			actionTimer = idleTime
	
	if isActive:
		velocity.x = speed
		if is_on_floor():
			velocity.y = jumpHeight
		if is_on_wall():
			flip_direction()
	else:
		if is_on_floor():
			velocity = Vector2.ZERO
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
	

func take_damage() -> void:
	health -= 1
	healthBar.set_health(health, maxHealth)
	if health == 0:
		queue_free()
		level9.summonThrone()

func _on_area_2d_3_area_entered(area: Area2D) -> void:
	take_damage()
	
func flip_direction() -> void:
	if turnAroundTimer <= 0:
		$SlimeKing.flip_h = !$SlimeKing.flip_h
		speed *= -1
		turnAroundTimer = turnAroundCoolDown
