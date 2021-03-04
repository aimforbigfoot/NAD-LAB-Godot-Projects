extends KinematicBody2D

export var speed := 300

func _physics_process(delta: float) -> void:
	var vel := speed * get_dir()
	vel = move_and_slide(vel)



func get_dir() -> Vector2:
	var dir : Vector2 = Vector2.ZERO
	dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return dir 

