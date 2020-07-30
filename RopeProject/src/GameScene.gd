extends Node2D


func _physics_process(delta: float) -> void:
	var diff : Vector2 = $KinematicBody2D.global_position - get_global_mouse_position()
	$KinematicBody2D.move_and_slide(-diff)
