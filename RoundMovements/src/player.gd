extends KinematicBody2D

export (float) var speed : float = 250.0

func _physics_process(delta: float) -> void:
	var vel := (speed * dir() * delta)
	vel = move_and_slide(vel)
	

func dir() -> Vector2:
	var _dir : Vector2
	_dir = (get_global_mouse_position() - global_position).floor()
#	_dir = (get_global_mouse_position() - global_position).floor().clamped(100)
	print(_dir.length())
	return _dir 

