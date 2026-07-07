extends CharacterBody2D
class_name SlimeMovement

@export var gravity: int = 50

func _physics_process(_delta: float) -> void:
	for i in get_slide_collision_count(): 
		var collision = get_slide_collision(i) 
		var collider = collision.get_collider()
		if collider is TileMapLayer:
			var col_layer = collider.tile_set.get_physics_layer_collision_layer(0)
			if col_layer & 16:
				kill_Slime()
		
func kill_Slime():
	self.queue_free()
