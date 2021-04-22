extends Node2D

onready var nav2d := $Navigation2D
onready var line := $Line2D
var firstPoint := Vector2.ZERO
var secondPoint := Vector2.ZERO

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		firstPoint = get_global_mouse_position()
		line.points = []
		
	if Input.is_action_just_released("click"):
		secondPoint = get_global_mouse_position()
		var arrPath : PoolVector2Array = nav2d.get_simple_path(firstPoint, secondPoint, true)
		$thingToMove.global_position = arrPath[0]
		$thingToMove.path = arrPath
		$thingToMove.index = 0
		print("hello")
		line.points = arrPath
		print(arrPath)
