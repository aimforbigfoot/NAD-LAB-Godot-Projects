extends Area2D

func _process(delta: float) -> void:
	var vel := (get_global_mouse_position() - global_position)
	global_position += vel
	pass
