extends KinematicBody2D

onready var positionNodes := $positionNodes
onready var rayNodes := $rayNodes

var vel := Vector2.ZERO
var player : KinematicBody2D
var speed := 400.0


func _ready() -> void:
	randomize()
	player = get_parent().get_node("player")
	$randomTock.connect("timeout",self,"randomTick")
	$bodyChecker.connect("body_entered",self,"bodyCollide")


func randomTick() -> void:
	$randomTock.wait_time = rand_range(0.5,1.0)
	moveTowardsPlayer()

func bodyCollide(body:Node) -> void:
	moveTowardsPlayer()

func moveTowardsPlayer() -> void:
	var velToMove := getVectorToMoveTowardsPlayer().normalized() * speed
	vel = velToMove


func _physics_process(delta: float) -> void:
	vel = move_and_slide(vel)
#	moveTowardsPlayer()



func getVectorToMoveTowardsPlayer() -> Vector2:
	var vec : Vector2
	var maxDist :float= INF
	var positionToUse : Vector2 = Vector2.ZERO
	var i :int= 0
	for node in positionNodes.get_children():
		var dist := player.global_position.distance_squared_to(node.global_position)
		if dist < maxDist:
			var ray : RayCast2D = rayNodes.get_child(i)
			if !ray.is_colliding():
				maxDist = dist
				positionToUse = node.global_position
		i += 1
	if positionToUse !=Vector2.ZERO:
		vec = positionToUse - global_position
	return vec








