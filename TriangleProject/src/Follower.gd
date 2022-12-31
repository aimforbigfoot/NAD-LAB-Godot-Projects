extends Node2D

var firstSpot : Position2D
var secondSpot : Position2D
var p  : Vector2
var q  : Vector2
var qmp : Vector2
var maxdot : float 

func _ready() -> void:
	firstSpot = get_parent().get_node("Position2D")
	secondSpot = get_parent().get_node("Position2D2")
	p = firstSpot.global_position
	q = secondSpot.global_position
	qmp = p - q
	maxdot = qmp.dot(qmp)

func _physics_process(delta: float) -> void:
	var mousePos :Vector2= (p - get_parent().get_global_mouse_position())
	var s = qmp.dot(mousePos)
	s = clamp( s, 0, maxdot )
	var factor : float = range_lerp( s, maxdot, 0 , 0, 1  )
	print(1-factor, " ",s)
	var final = (qmp * factor)  + q
	global_position = final
#	print(final, " ", s, " ", factor)
