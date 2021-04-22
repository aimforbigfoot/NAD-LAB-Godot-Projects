extends Area2D

signal playerWantsToRemoveAllEnemies

func _ready() -> void:
	connect("mouse_entered",self,"mouseEntered")

func mouseEntered() -> void:
	emit_signal("playerWantsToRemoveAllEnemies")
	print("mouse entered")
