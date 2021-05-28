extends KinematicBody2D

var path : PoolVector2Array
var index := 0

func _physics_process(delta: float) -> void:
	if path:
		var vel : Vector2
		
		if index < path.size()-1:
			vel = path[index+1] - position
			if are_these_close_to_each_other(global_position, path[index+1]):
				index += 1
		else:
			vel = Vector2.ZERO
		vel = move_and_slide(vel.normalized()*300)


func are_these_close_to_each_other(a,b) -> bool:
	var res := false
	var mar := 10
	if (abs(abs(a.x) - abs(b.x)) < mar) and (abs(abs(a.y) - abs(b.y)) < mar):
		res = true
	return res

#                a.x - b.x < mar




