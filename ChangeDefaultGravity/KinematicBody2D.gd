extends KinematicBody2D


func _physics_process(delta: float) -> void:
	var diff := (get_global_mouse_position() - global_position).normalized()
	var vel := diff * 200.0
	vel = move_and_slide(vel)
