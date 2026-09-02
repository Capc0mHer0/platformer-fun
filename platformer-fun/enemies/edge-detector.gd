extends RayCast2D

func _process(_delta: float) -> void:
	if not is_colliding():
		get_parent().flip_direction()
		
		
		
	
