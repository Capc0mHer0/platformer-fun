extends Node2D


@onready var healthBar: HealthBar = $HealthBar
@export var maxHealth = 20

var health: int = maxHealth

func _ready() -> void:
	pass

func take_damage() -> void:
	health -= 1
	healthBar.set_health(health, maxHealth)
	if health == 0:
		queue_free()

func _on_area_2d_3_area_entered(area: Area2D) -> void:
	print("youch")
	take_damage()
	
