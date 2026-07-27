extends CanvasLayer
class_name HealthBar

@onready var health: ColorRect = $CenterContainer/Control/HealthBar
var maxHealth: float

func _ready() -> void:
	maxHealth = health.size.x

func set_health(remainingHealth: float, totalHealth: float) -> void:
	health.size.x = maxHealth * remainingHealth / totalHealth
