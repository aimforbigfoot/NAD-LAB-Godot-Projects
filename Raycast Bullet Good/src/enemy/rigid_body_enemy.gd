extends RigidBody2D

#So we can kill the enemy
func die() -> void:
	queue_free()


func _on_rigid_body_enemy_body_entered(body: Node) -> void:
	if body:
		queue_free()
#The reason if body is there is because I want to reduce errors in the Debugger
