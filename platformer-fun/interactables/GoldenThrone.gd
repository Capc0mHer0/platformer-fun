extends Node2D


func summonThrone():
	$Golden_Throne.visible = true
	$Golden_Throne/CollisionShape2D.set_deferred("disabled", false)
	
func _on_golden_throne_body_entered(body: Node2D) -> void:
	SceneManager.call_deferred("goToCreditsScene")
