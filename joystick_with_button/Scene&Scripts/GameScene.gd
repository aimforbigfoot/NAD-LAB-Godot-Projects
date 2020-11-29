extends Node2D

onready var front: = $Joystick/front_sprite
onready var back: = $Joystick/back_sprite
onready var player:= $player
export var speed_multiplier: = 3


func _process(delta: float) -> void:
	player.velocity = values_between_frontandback() * speed_multiplier


func values_between_frontandback() -> Vector2:
	var vec : Vector2 = front.global_position - back.global_position
	return vec

