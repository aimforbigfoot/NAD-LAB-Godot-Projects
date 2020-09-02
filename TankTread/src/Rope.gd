extends Node2D

#
func _ready() -> void:
	for i in range(1, get_child_count()):
		print(i)
		if !i==get_child_count()-1:
			var prev_obj := get_child(i-1)
			var next_obj := get_child(i+1)
			var obj := get_child(i)
			if obj is Joint2D:
				obj.softness = 10
				obj.bias = 0.9
				print(obj.node_a, obj.node_b)
				obj.node_a = prev_obj.get_path()
				obj.node_b = next_obj.get_path()
#				obj.node_a = prev_obj
		else:
			print('hei')
			var obj := get_child(i)
			if obj is Joint2D:
				obj.node_a = get_child((i-1)).get_path()
				obj.node_b = get_child(0).get_path()
				pass
				
#Thanks to Haledire on the Godot Discord Server for lines 14-15
#				obj.node_b = next_obj
	pass
