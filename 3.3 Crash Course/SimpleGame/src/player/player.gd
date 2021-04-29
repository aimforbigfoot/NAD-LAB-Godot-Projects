extends KinematicBody2D

var speed := 400.0
var screensize : Vector2 

func _ready() -> void:
	screensize = get_viewport_rect().size
	global_position = screensize/2


func _physics_process(delta: float) -> void:
	var vel : Vector2 = get_dir() * speed
	move_and_slide(vel)

func get_dir() -> Vector2:
	var dir : Vector2
	dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return dir

















