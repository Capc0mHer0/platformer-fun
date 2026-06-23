extends Node2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var springSound: AudioStreamPlayer2D = $BoingSound

func _on_jumpbox_body_entered(player: Player) -> void:
	animation.play("active")
	player.launch()
	springSound.play()
