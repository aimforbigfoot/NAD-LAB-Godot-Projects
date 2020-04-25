extends KinematicBody2D

onready var gun := $Position2D/Gun
onready var gun_holder := $Position2D
export var speed := 500
var deg_for_bullet : float
var vel : Vector2
var screensize : Vector2

func _ready() -> void:
	Global.player = self
	screensize = get_viewport_rect().size
	position = screensize/2


func _physics_process(delta: float) -> void:
	gun_stuff()
	vel = speed * get_dir()
	move_and_slide(vel)

func gun_stuff() -> void:
	var mouse_pos : Vector2 = get_global_mouse_position()
	deg_for_bullet = mouse_pos.angle_to_point(gun.global_position)
	gun_holder.look_at(mouse_pos)
	
	if global_position.x > mouse_pos.x:
		gun.scale.y = -1
	else:
		gun.scale.y = 1 
#
func get_dir() -> Vector2:
	var dir : Vector2
	dir.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	dir.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return dir
