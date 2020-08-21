extends KinematicBody2D


func _process(delta: float) -> void:
	global_position += (((get_global_mouse_position() - global_position).floor().normalized()) * 5)
