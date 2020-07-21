extends Node2D

onready var front: = $Joystick/front_sprite
onready var back: = $Joystick/back_sprite
onready var player:= $Player

export var speed_multiplier: = 3

var distancebetween_front_and_backx:float = 0.0
var distancebetween_front_and_backy:float = 0.0
var anglebetween: = 0

func _ready() -> void:
	return


func _process(delta: float) -> void:
	player.velocity = values_between_frontandback() * speed_multiplier
#	player.rotation_degrees = rad2deg(front.global_position.angle_to_point(back.global_position)) #use this to make the character point a certain direction
	

func values_between_frontandback() -> Vector2:
#	Returns a vector that esentially points in the direction of the front sprite from the back sprite
	var vec : Vector2 = front.global_position - back.global_position
	return vec

func _input(event: InputEvent) -> void:
	print(event)
