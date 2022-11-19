extends Node2D

signal doneMoving

func _ready() -> void:
	$Tween.connect("tween_all_completed",self,"tweenDone")
	

func tweenDone() -> void:
	emit_signal("doneMoving")
	
func moveTo(posToMoveTo:Vector2) -> void:
	$Tween.interpolate_property(self,"global_position", global_position,posToMoveTo,0.4, Tween.TRANS_CUBIC,Tween.EASE_OUT)
	$Tween.start()
func setPos(posToSetTo:Vector2)->void:
	global_position = posToSetTo
