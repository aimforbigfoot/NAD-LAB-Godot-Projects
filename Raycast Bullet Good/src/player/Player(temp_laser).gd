extends KinematicBody2D

#Important Vars to the video 
onready var raycast2d := $RayCast2D
onready var shoot_timer := $can_shoot_timer
onready var vfx_line := $vfx_line
var shoot_bool : bool = true
#Vars that are not important to the video 
export var speed := 420



func _physics_process(delta: float) -> void:
	var vel := speed * get_dir()
	move_and_slide(vel)
	raycast_bullet_stuff()


func get_dir() -> Vector2:
	var dir : Vector2 = Vector2.ZERO
	dir.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	dir.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return dir


func raycast_bullet_stuff() -> void:
	var mouse_pos := get_global_mouse_position()
	var angle_from_mouse_to_player := mouse_pos.angle_to_point(global_position)
	rotation = (angle_from_mouse_to_player - (PI/2))
	
	if raycast2d.is_colliding() and Input.is_action_pressed("shoot") and shoot_bool == true:
		make_line_and_shoot_mechanics()
		make_particles()
		check_if_we_can_kill_enemy()


func make_line_and_shoot_mechanics() -> void:
	vfx_line.points[1] = transform.xform_inv(raycast2d.get_collision_point())
	shoot_bool = false
	shoot_timer.start(0.05)


func make_particles() -> void:
	var hit_particles := preload("res://src/player/hit_particles.tscn").instance()
	hit_particles.emitting = true
	hit_particles.global_position = raycast2d.get_collision_point()
	get_parent().add_child(hit_particles)


func check_if_we_can_kill_enemy() -> void:
#	print(raycast2d.get_collision_point())
#	print(raycast2d.get_collider())				These 3 statments useful for understanding 
#	print(raycast2d.get_collider_shape())		How the next few lines work
	if raycast2d.get_collider_shape() == 0:
		if raycast2d.get_collider().has_method("die"):
			raycast2d.get_collider().die()
			print("we have a hit")


func _on_can_shoot_timer_timeout() -> void:
	vfx_line.points[1] = Vector2.ZERO
	shoot_bool = true
