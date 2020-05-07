extends StaticBody2D

onready var collison_shape := $CollisionPolygon2D
onready var shape_itself := $CollisionPolygon2D/Polygon2D
var range_of_shape := 8

func _physics_process(delta: float) -> void:
	shape_itself.polygon = collison_shape.polygon
	change_the_shape()


func change_the_shape() -> void:
	for i in collison_shape.polygon.size():
		var rand := rand_range(-range_of_shape, range_of_shape)
		randomize()
		var rand2 := rand_range(-range_of_shape, range_of_shape)
		collison_shape.polygon[i] += Vector2(rand, rand2)

