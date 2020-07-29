extends KinematicBody2D

export var speed := 500
var screensize : Vector2
func _ready() -> void:
	screensize = get_viewport_rect().size


func _physics_process(delta: float) -> void:
	for i in get_children(): 
		i.rotation = get_global_mouse_position().angle_to_point(global_position)
#Try using line 13 and seeing what happens
#	rotation = get_global_mouse_position().angle_to_point(global_position)
#	This, line 13 is what happens with rotating the entire player
	frame_checker_and_teleporter()
	
	var vel := speed * get_dir()
	vel = move_and_slide(vel)
	


func get_dir() -> Vector2:
	var dir : Vector2 = Vector2.ZERO
	dir.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	dir.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return dir 


func frame_checker_and_teleporter() -> void:
	global_position.x = wrapf(global_position.x, 0, screensize.x)
	global_position.y = wrapf(global_position.y, 0, screensize.y)

