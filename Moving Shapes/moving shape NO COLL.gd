extends Polygon2D


func _process(delta: float) -> void:
	for i in polygon.size():
		var range_of_shape := 8
		var rand := rand_range(-range_of_shape, range_of_shape)
		randomize()
		var rand2 := rand_range(-range_of_shape, range_of_shape)
		polygon[i] += Vector2(rand, rand2)
