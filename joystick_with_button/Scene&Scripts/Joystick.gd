extends Node2D

onready var back: Sprite = $back_sprite
onready var front: Sprite = $front_sprite
export var ease_value: float = 0.25
export var range_of_joystick: int = 200 
var screensize: Vector2 = Vector2.ZERO
var left_max_size_x: float
var right_max_size_x: float 
var top_max_size_y: float 
var bottom_max_size_y: float

func _ready() -> void:
	screensize = get_viewport_rect().size
	left_max_size_x = back.global_position.x - range_of_joystick
	right_max_size_x = back.global_position.x + range_of_joystick
	top_max_size_y = back.global_position.y - range_of_joystick
	bottom_max_size_y = back.global_position.y + range_of_joystick


func _process(delta: float) -> void:
	front_related()


func front_related() -> void:
	var mouse_pos: = get_global_mouse_position()
	if mouse_pos.x > 720:
		front.global_position = lerp(front.global_position, back.global_position, ease_value)
	elif Input.is_action_pressed("click"):
		front.global_position = lerp(front.global_position, mouse_pos, ease_value)
		front.global_position.x = clamp(front.global_position.x, left_max_size_x, right_max_size_x)
		front.global_position.y = clamp(front.global_position.y, top_max_size_y, bottom_max_size_y)
	else:
		front.global_position = lerp(front.global_position, back.global_position, ease_value)











