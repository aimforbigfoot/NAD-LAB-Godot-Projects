extends Area2D

#So the enemy dies
func die() -> void:
	queue_free()


func _on_area2D_enemy_body_entered(body: Node) -> void:
	if body:
		queue_free()
