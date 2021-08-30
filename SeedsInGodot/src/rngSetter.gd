extends Node2D

export var seedName := ""

func _ready() -> void:
	var seedToUse : int
	
	if seedName:
		seedToUse = hash( seedName )
	else:
		seedToUse = randi()
	
	seed( seedToUse )
	print( seedToUse, " is the seed being used" )
