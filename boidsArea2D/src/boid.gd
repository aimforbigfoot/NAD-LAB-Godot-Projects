extends Area2D

onready var rayFolder := $rayFolder.get_children()
var boidsISee := []
var vel := Vector2.ZERO
var speed := 7.0
var screensize : Vector2
var movv := 48


func _ready() -> void:
	screensize = get_viewport_rect().size
	randomize()


func _physics_process(delta: float) -> void:
	boids()
	checkCollision()
	vel = vel.normalized() * speed
	move()
	rotation = lerp_angle(rotation, vel.angle_to_point(Vector2.ZERO), 0.4)


func boids() -> void:
	if boidsISee:
		var numOfBoids := boidsISee.size()
		var avgVel := Vector2.ZERO
		var avgPos := Vector2.ZERO
		var steerAway := Vector2.ZERO
		for boid in boidsISee:
			avgVel += boid.vel
			avgPos += boid.position
			steerAway -= (boid.global_position - global_position) * (movv/( global_position- boid.global_position).length())

		avgVel /= numOfBoids
		vel += (avgVel - vel)/2

		avgPos /= numOfBoids
		vel += (avgPos - position)

		steerAway /= numOfBoids
		vel += (steerAway)


func checkCollision() -> void:
	for ray in rayFolder:
		var r : RayCast2D = ray
		if r.is_colliding():
			if r.get_collider().is_in_group("blocks"):
				var magi := (100/(r.get_collision_point() - global_position).length_squared())
				vel -= (r.cast_to.rotated(rotation) * magi)
		pass


func move() -> void:
	global_position += vel
	if global_position.x < 0:
		global_position.x = screensize.x 
	if global_position.x > screensize.x:
		global_position.x = 0
	if global_position.y < 0:
		global_position.y = screensize.y 
	if global_position.y > screensize.y:
		global_position.y = 0

	
	


func _on_vision_area_entered(area: Area2D) -> void:
	if area != self and area.is_in_group("boid"):
		boidsISee.append(area)


func _on_vision_area_exited(area: Area2D) -> void:
	if area:
		boidsISee.erase(area)


func _on_boid_body_entered(body: Node) -> void:
	if body:
		print("hit smth :(")
