extends Node2D

onready var back: Sprite = $back_sprite
onready var front: Sprite = $front_sprite
export var ease_value: float = 0.25
export var range_of_joystick: int = 250 
var screensize: Vector2

func _ready() -> void:
	screensize = get_viewport_rect().size


func _process(_delta: float) -> void:
	front_related()

func front_related() -> void:
	var mousePos := back.get_local_mouse_position().clamped(range_of_joystick)+back.global_position
	if Input.is_mouse_button_pressed(1): #send to where to where the mouse position is
		front.global_position = lerp(front.global_position, mousePos, ease_value)
	else: #send back to the center
		front.global_position = lerp(front.global_position, back.global_position, ease_value)

#func _input(event: InputEvent) -> void:
#	if event.is_action_pressed("click"):
#		if event.position.y < 1750 and event.position.y > 1250:
#			back.global_position = event.position













