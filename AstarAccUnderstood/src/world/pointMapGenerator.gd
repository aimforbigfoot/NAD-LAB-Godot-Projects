extends Node2D

var pointMaps := [
#	preload("res://src/pointMap/pointMap1.tscn"),
	preload("res://src/pointMap/pointMap2.tscn"),
#	preload("res://src/pointMap/pointMapTest.tscn")
]
var marg := 25
const idealStartPos := Vector2( 0,300 )
const rightPos := Vector2( 1024,300 )
var line : Line2D
var crusier : Node2D
var mapDone := false
var astar := AStar2D.new()
var dictOfPoints :Dictionary= {} # search with id
var dictOfIds :Dictionary= {} # search with points

func _ready() -> void:
	randomize()
	crusier = get_parent().get_node("Cruiser")
	line = get_parent().get_node("Line2D")
	crusier.connect("doneMoving",self,"doneMovingCrusier")
	makeMap()
	

func makeMap() -> void:
	placePointsFromMap()
	connectPointsOnMap(2)
	yield( get_tree(),"idle_frame" )
	areLeftAndRightConnected()
	yield( get_tree(),"idle_frame" )
	placeCrusierOnLeftMostPoint()
	pointsConnectedToCrusierPoint()
	
	mapDone = true
	update()



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		for point in pointsConnectedToCrusierPoint():
			var dist:float=get_global_mouse_position().distance_squared_to( point.global_position )
			if  dist < point.marg:
				line.hide()
				moveCrusierToThisPoint( point.global_position )

func pointsConnectedToCrusierPoint() -> Array:
	var arrOfConnectedPoints:Array
	var pointToGetConnectionsOf : Node2D = getClosestPointToPosPassedIn(crusier.global_position)
	var idOfPointToGetConnectionsOf : int = dictOfIds[ pointToGetConnectionsOf ]
	
	var arrOfPointIdsThatAreConnectedToTheMainPoint : Array = astar.get_point_connections( idOfPointToGetConnectionsOf )
	for id in arrOfPointIdsThatAreConnectedToTheMainPoint:
		arrOfConnectedPoints.append(  dictOfPoints[ id ]  )
		
	setLine2DToSomeLines( arrOfConnectedPoints, pointToGetConnectionsOf.global_position )
	return arrOfConnectedPoints


func setLine2DToSomeLines(arrOfPoses:Array,centerPos:Vector2) -> void:
	line.clear_points()
	var ind : int = 0
	for pos in arrOfPoses:
		line.add_point( (pos.global_position) , ind )
		line.add_point( (centerPos) , ind+1 )
		ind += 2
	pass







func moveCrusierToThisPoint(pos:Vector2) -> void:
	crusier.moveTo(pos)

func placePointsFromMap() -> void:
	var pointMap:Node2D=pointMaps[ floor( pointMaps.size() * randf() ) ].instance()
	add_child(pointMap)
	for pointOnPointMap in pointMap.get_children():
		var point :Node2D= preload("res://src/point/point.tscn").instance()
		add_child(point)
		point.global_position = pointOnPointMap.global_position + randAmtToAdd()
	remove_child(pointMap)


func connectPointsOnMap(numToConnectWith:int=1) -> void:
	for point in get_children():
		var pointId :int= astar.get_available_point_id()
		dictOfPoints[pointId] = point
		dictOfIds[ point ] = pointId
		astar.add_point( pointId ,  point.global_position )
		
	for pointID in astar.get_points():
		var pointPosition := astar.get_point_position( pointID )
		
		var arrOfPoints := [  ]
		var distOfPoints := [  ]

		for secondPointId in astar.get_points():
			if secondPointId != pointID:
				var secondPointPosition :Vector2= astar.get_point_position(secondPointId)
				var dist:=pointPosition.distance_squared_to(secondPointPosition)
				distOfPoints.append( dist )
				arrOfPoints.append( secondPointId )
	
#		print(pointID, " ", distOfPoints)
#		print(pointID, " ", arrOfPoints)
		
		var sortedDistofPoints := distOfPoints.duplicate()
		sortedDistofPoints.sort()
#		print(pointID, " ", sortedDistofPoints)

		for i in numToConnectWith:
			var indexToUse := distOfPoints.find( sortedDistofPoints[i] )
			var idOfCurrentlyClosestPoint :int= arrOfPoints[ indexToUse ] 
			astar.connect_points( pointID, idOfCurrentlyClosestPoint, true )

func areLeftAndRightConnected() -> void:
	var leftPoint : Node2D = getClosestPointToPosPassedIn( idealStartPos )
	var rightPoint : Node2D = getClosestPointToPosPassedIn( rightPos  )
#
	var leftPointId : int = dictOfIds[ leftPoint ]
	var rightPointId : int = dictOfIds[ rightPoint ]
#
	if not (astar.get_point_path(leftPointId, rightPointId)):
		print("wasnt a good map")
		get_tree().reload_current_scene() #clear everything and make map again, whatever u want
	pass

func getClosestPointToPosPassedIn(posToStartAt:Vector2) -> Node2D:
	var maxDist = INF
	var pointToReturn : Node2D
	for point in get_children():
		var dist:float=posToStartAt.distance_squared_to( point.global_position )
		if dist < maxDist:
			pointToReturn = point
			maxDist = dist
	return pointToReturn


func placeCrusierOnLeftMostPoint() -> void:
	var leftMostPoint := getClosestPointToPosPassedIn( idealStartPos )
#	if crusier:
#		crusier.setPos(leftMostPoint.global_position)
	if is_instance_valid(crusier):
		if crusier.has_method("setPos"):
			crusier.call("setPos",leftMostPoint.global_position)


func _draw() -> void:
	if astar and mapDone:
		for p in astar.get_points():
			for c in astar.get_point_connections(p):
				var pp = astar.get_point_position(p)
				var cp = astar.get_point_position(c)
				draw_line(Vector2(pp.x, pp.y),
				Vector2(cp.x, cp.y),
				Color("ebeae6"), 2, true)


func doneMovingCrusier() -> void:
	line.show()
	pointsConnectedToCrusierPoint()


func randAmtToAdd() -> Vector2:
	return Vector2( rand_range(-marg, marg) , rand_range(-marg, marg) )

