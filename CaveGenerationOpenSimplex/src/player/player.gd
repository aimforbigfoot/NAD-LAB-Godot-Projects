extends KinematicBody2D
export var speed : = 400
var vel : Vector2



func _physics_process(delta: float) -> void:
	vel = speed * get_dir()
	vel = move_and_slide(vel)


func get_dir() -> Vector2:
	var dir : Vector2
	dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return dir


