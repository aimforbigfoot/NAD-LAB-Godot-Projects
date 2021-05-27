extends Spatial


func  _ready() -> void:
	var angle = $orange/orange.angle_to( $purple.global_transform.origin )
	$orange = $orange.global_transform.rotated( $orange.global_transform.scaled() )
	THIS WAS JUST FOR MY UNDERSTANDING 
