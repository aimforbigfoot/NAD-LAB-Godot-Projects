extends TileMap


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		var tile = world_to_map(event.position)
		set_cell(tile.x, tile.y, -1)
		
	elif event.is_action_pressed("right_click"):
		var tile = world_to_map(event.position)
		set_cell(tile.x, tile.y, 0)
	pass
