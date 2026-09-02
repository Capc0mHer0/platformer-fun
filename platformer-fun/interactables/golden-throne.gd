extends Node2D

func _ready() -> void:
	MusicPlayer.stop()

func summonThrone():
	$Golden_Throne.visible = true
	$Golden_Throne/CollisionShape2D.set_deferred("disabled", false)
