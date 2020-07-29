extends KinematicBody2D

export var speed := 500
onready var player_sprite := $Sprite
var screensize : Vector2
var sprite_size : Vector2 

var left_x : float = 0.0
var right_x : float = 0.0
var top_y : float = 0.0
var bottom_y : float = 0.0

func _ready() -> void:
	screensize = get_viewport_rect().size
	sprite_size = player_sprite.get_rect().size
	left_x = -(sprite_size.x/2)
	right_x = screensize.x + (sprite_size.x/2)
	top_y = -(sprite_size.y/2)
	bottom_y = screensize.y + (sprite_size.y/2)


func _physics_process(delta: float) -> void:
	rotation = get_global_mouse_position().angle_to_point(global_position)
	var vel := speed * get_dir()
	vel = move_and_slide(vel)
	
	wall_checker_and_teleporter()


func get_dir() -> Vector2:
	var dir : Vector2 = Vector2.ZERO
	dir.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	dir.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return dir 


func wall_checker_and_teleporter() -> void:
	global_position.x = wrapf(global_position.x, left_x, right_x)
	global_position.y = wrapf(global_position.y, top_y, bottom_y)

