extends Node2D

var screensize : Vector2
onready var line2d := $Line2D
onready var line2dperp := $Line2Dperp

func _ready() -> void:
	screensize = get_viewport_rect().size

func _draw() -> void:
	print("hello")
	draw_circle(Vector2.ZERO, 100.0, Color.rebeccapurple)
	line2d.points[0] = Vector2.ZERO

func _process(delta: float) -> void:
	line2d.points[1] = get_local_mouse_position().clamped(100)
	line2dperp.position = line2d.points[1]
	line2dperp.rotation = (get_local_mouse_position().angle_to_point(Vector2.ZERO) + (PI/2))
