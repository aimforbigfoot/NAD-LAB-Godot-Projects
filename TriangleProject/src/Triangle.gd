extends Node2D

var globalObject : Node2D

onready var firstSpot := $Position2D
onready var secondSpot := $Position2D2
onready var regLine := $Line2D
onready var mouseLine := $mouseStraigt
onready var follower := $Follower

func _ready() -> void:
	globalObject = get_parent().get_node("mouse")
	regLine.points[0] = firstSpot.position
	regLine.points[1] = secondSpot.position
	regLine.points[3] = firstSpot.position
	var midPoint :Vector2= (  firstSpot.position + secondSpot.position  ) / 2
	mouseLine.points[1] = midPoint
	follower.position = secondSpot.position 



func _physics_process(delta: float) -> void: 
	regLine.points[2] = get_local_mouse_position()
	mouseLine.points[0] = get_local_mouse_position()
