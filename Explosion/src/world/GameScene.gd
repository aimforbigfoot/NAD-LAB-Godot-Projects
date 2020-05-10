extends Node2D

onready var particles := $Explosion_particles
onready var rigid := $rigids
#This var is for the max speed wanted
export var greatest_force := 100
#This var is for the 
export var farthest_mar := 50

#Debug - you can totally delete this 
func _process(delta: float) -> void:
	$debug.position = get_global_mouse_position()
	$Line2D.points[0] = get_global_mouse_position()
	$Line2D.points[1] = $rigids/RigidBody2D.global_position


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		particles.emitting = true
		particles.global_position = get_global_mouse_position()
		
		for i in rigid.get_child_count():
			var rigid_body_child : = rigid.get_child(i)
			var pos_of_rigid : Vector2 = rigid_body_child.global_position
			rigid_body_child.force_var = force_finder(pos_of_rigid)
			rigid_body_child.push()
#			print(i)


func force_finder(pos_of_rigid : Vector2) -> Vector2:
	var vec : Vector2 = Vector2.ZERO 
	var mouse_pos := get_global_mouse_position()
	var x_val := 5000
	var divider : = Vector2(x_val, x_val)

	vec = divider/(pos_of_rigid-mouse_pos)

#postive side to clamp close x values
	if vec.x >= greatest_force:
		vec.x = greatest_force
	elif vec.x <= -greatest_force:
		vec.x = -greatest_force
#negative side to clamp close x values
	if vec.y >= greatest_force:
		vec.y = greatest_force
	elif vec.y <= -greatest_force:
		vec.y = -greatest_force

#This is to ensure that the farthest object does not experince the most amount of force
	if vec.x < farthest_mar and vec.x > -farthest_mar:
		vec = Vector2.ZERO
#		print("xes")
	if vec.y < farthest_mar and vec.y > -farthest_mar:
		vec = Vector2.ZERO
#		print("yes")

	print(vec)
	return vec 
#if you wonder why the closest value is bigger than the farthest value, it is becuase
#when you get the vec value, it's already the y value of the function, so the smallest
#x value becomes big, and the biggest x value becomes small. 
