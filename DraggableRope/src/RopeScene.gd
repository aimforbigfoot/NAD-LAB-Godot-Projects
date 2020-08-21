extends Node2D

func _ready() -> void:
	for i in range(1, get_child_count()-1):
		var obj := get_child(i)
		if obj is Joint2D:
			var prev_obj := get_child(i-1)
			var next_obj := get_child(i+1)
#Thanks to Haledire on the Godot Discord Server for lines 10-11
			obj.node_a = prev_obj.get_path()
			obj.node_b = next_obj.get_path()

