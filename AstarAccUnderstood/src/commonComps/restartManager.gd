extends Node2D


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.scancode == KEY_R:
			get_tree().reload_current_scene()
