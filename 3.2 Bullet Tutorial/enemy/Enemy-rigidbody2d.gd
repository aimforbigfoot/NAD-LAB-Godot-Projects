extends RigidBody2D

# AI of enemy that allows for 1,000,000 IQ plays :)
func _ready() -> void:
	randomize()
	var x_rand = randi() % 100
	var y_rand = randi() % 100
	linear_velocity = Vector2(x_rand, y_rand)
	pass



func die():
	queue_free()
