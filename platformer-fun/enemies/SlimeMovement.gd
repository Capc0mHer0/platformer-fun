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
				kill_Slime(null)
		
func kill_Slime(body: Node2D):
	if body is Player and not is_player_stomping_me(body):
		return
	if body is Player:
		body.launch(-300)
	self.queue_free()

func is_player_stomping_me(player: Player) -> bool:
	return player.previousVelocity.y > 0 and player.previousPosition.y < global_position.y
