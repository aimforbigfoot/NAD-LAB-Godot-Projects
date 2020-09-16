extends Node2D

onready var back: Sprite = $back_sprite
onready var front: Sprite = $front_sprite
export var ease_value: float = 0.25
export var range_of_joystick: int = 250 
var screensize: Vector2 = Vector2.ZERO

func _ready() -> void:
	screensize = get_viewport_rect().size


func _process(delta: float) -> void:
	front_related()

func front_related() -> void:
	var clampedMousePos := back.get_local_mouse_position().clamped(range_of_joystick)+back.global_position
	if Input.is_mouse_button_pressed(1):
		front.global_position = lerp(front.global_position, clampedMousePos, ease_value)
	
	else:
		front.global_position = lerp(front.global_position, back.global_position, ease_value)

