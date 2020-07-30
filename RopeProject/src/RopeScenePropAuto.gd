extends Node2D

export var y_val := 0

func _ready() -> void:
	for i in range(1, get_child_count()-1):
#		problem, i starts at something like and it goes by odd numbers
		var obj := get_child(i)
		if obj is Joint2D:
			var prev_obj := get_child(i-1)
			var next_obj := get_child(i+1)
			
			prev_obj.global_position = Vector2( (i*8), y_val )
			next_obj.global_position = Vector2( (i*(16/3)), y_val )
			obj.global_position = Vector2( (i*8), y_val )
			
#Thanks to Haledire on the Godot Discord Server for lines 14-15
			obj.node_a = prev_obj.get_path()
			obj.node_b = next_obj.get_path()
