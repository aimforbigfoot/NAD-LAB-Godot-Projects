extends Area2D

var dir : Vector2 = Vector2.ZERO
var speed := 3
func _physics_process(delta: float) -> void:
	global_position += dir*speed


func _on_Timer_timeout() -> void:
	queue_free()


func _on_enemy_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		body.die()
