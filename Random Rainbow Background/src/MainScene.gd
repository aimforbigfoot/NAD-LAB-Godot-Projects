extends Node2D


#Not needed unless you want to have the frame restart
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
