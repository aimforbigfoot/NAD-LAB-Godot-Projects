extends TileMap


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("click"):
		startTheFill( get_global_mouse_position() )

func startTheFill( worldPos:Vector2 , cellToSet:int=1 ) -> void:
#	setup
	var mapPosStart := world_to_map(worldPos)
	var cellTypeToReplace := get_cell(mapPosStart.x, mapPosStart.y)
#	flooding and filling
	set_cell( mapPosStart.x, mapPosStart.y, cellToSet )
	
	var q := [ mapPosStart ]
	var i := 0
	while q:
		i += 1
		var currCell :Vector2= q.pop_front()
		
		if get_cell( currCell.x-1, currCell.y ) == cellTypeToReplace:
			set_cell( currCell.x-1, currCell.y, cellToSet)
			q.append( Vector2(currCell.x-1, currCell.y) )
	
		if get_cell( currCell.x+1, currCell.y ) == cellTypeToReplace:
			set_cell( currCell.x+1, currCell.y, cellToSet)
			q.append( Vector2(currCell.x+1, currCell.y) )

		if get_cell( currCell.x, currCell.y-1 ) == cellTypeToReplace:
			set_cell(currCell.x, currCell.y-1, cellToSet)
			q.append( Vector2( currCell.x, currCell.y-1 ) )

		if get_cell( currCell.x, currCell.y+1 ) == cellTypeToReplace:
			set_cell(currCell.x, currCell.y+1, cellToSet)
			q.append( Vector2( currCell.x, currCell.y+1 ) )




