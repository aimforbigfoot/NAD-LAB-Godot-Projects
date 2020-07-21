extends Node2D

onready var back: Sprite = $back_sprite
onready var front: Sprite = $front_sprite
export var min_height_of_joystick : int = 1300
export var ease_value: float = 0.25
export var range_of_joystick: int = 200 
var screensize: Vector2 = Vector2.ZERO

func _ready() -> void:
	screensize = get_viewport_rect().size
	front_extents_maker()


func _process(delta: float) -> void:
	front_related()


func front_related() -> void:
	var mouse_pos: = get_global_mouse_position()
	
	if mouse_pos.x > screensize.x/(1.4):
		return
	
	if Input.is_mouse_button_pressed(1):
		front.global_position = lerp(front.global_position, mouse_pos, ease_value)
		front.global_position.x = clamp (front.global_position.x, front_extents_maker()[0], front_extents_maker()[1])
		front.global_position.y = clamp (front.global_position.y, front_extents_maker()[2], front_extents_maker()[3])
	else:
		front.global_position = lerp(front.global_position, back.global_position, ease_value)


##This input event is only here to make a dynamic joystick, allows you to reset the back position based on inital click
#func _input(event: InputEvent) -> void:
#	if event is InputEventMouseButton:
#		var Y_max_height_for_back: = screensize.y - range_of_joystick
#		if event.position.y < Y_max_height_for_back and event.position.y > min_height_of_joystick:
#			back.global_position = event.position
#			front_extents_maker()
#		else:
#			pass


# Works by taking the back.globalposition and subrtacting or adding it by a "range_of_joystick" amount. So it make a box / margin
func front_extents_maker() -> Array:
	var left_max_size_x: float = back.global_position.x - range_of_joystick
	var right_max_size_x: float = back.global_position.x + range_of_joystick
	var top_max_size_y: float = back.global_position.y - range_of_joystick
	var bottom_max_size_y: float = back.global_position.y + range_of_joystick
	var arr: Array = [left_max_size_x, right_max_size_x, top_max_size_y, bottom_max_size_y]
	return arr
