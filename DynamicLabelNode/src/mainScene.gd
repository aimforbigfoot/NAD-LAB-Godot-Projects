extends Node2D

onready var lbl := $Label
onready var line := $Line2D


func _ready() -> void:
	line.points[0] = Vector2.ZERO


func _process(delta: float) -> void:
	line.points[1] = get_global_mouse_position()
	lbl.rect_position = (  (get_global_mouse_position()/2)   + Vector2(25,50))
#	lbl.rect_size/2
