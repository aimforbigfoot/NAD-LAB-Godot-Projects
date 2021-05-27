extends StaticBody

var posToMoveTo := 100.0

func _ready() -> void:
	$Tween.connect("tween_all_completed",self,"tweenDone")
#	tweenDone()

func tweenDone() -> void:
	if posToMoveTo == 100.0:
		posToMoveTo = -100.0
	else:
		posToMoveTo = 100.0
	$Tween.interpolate_property( self,"global_transform:origin:z",global_transform.origin.z, posToMoveTo, 10.0,Tween.TRANS_CUBIC, Tween.EASE_IN_OUT )
	$Tween.start()
