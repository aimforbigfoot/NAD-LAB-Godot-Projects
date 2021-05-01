extends KinematicBody2D

export var speed := 500
var vel : Vector2 = Vector2.ZERO
var extraVel := Vector2.ZERO

func _physics_process(delta: float) -> void:
	vel = speed * get_dir().normalized()
	if Input.is_action_just_pressed("click"):
#		firing a bullet
		var diff := (global_position-get_global_mouse_position()).normalized()*1000
		extraVel = diff
	$Position2D.look_at(get_global_mouse_position())
	extraVel = lerp(extraVel, Vector2.ZERO, 0.1)
	vel = move_and_slide(vel+extraVel)

func get_dir() -> Vector2:
	var dir : Vector2 = Vector2.ZERO
	dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return dir 
