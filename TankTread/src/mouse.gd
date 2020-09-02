extends KinematicBody2D


func _physics_process(delta: float) -> void:
	var diff := (global_position - get_global_mouse_position()).floor().clamped(100)
	move_and_slide(diff*-5)
