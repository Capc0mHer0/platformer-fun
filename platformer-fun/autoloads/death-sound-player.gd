extends AudioStreamPlayer2D

var deathSound = preload("res://assets/sounds/death.wav")

func _ready():
	stream = deathSound
