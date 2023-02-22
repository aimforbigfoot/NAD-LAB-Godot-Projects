extends Node2D

signal turnedKnob

var following := false
const MAX_DIST := 7000

func _physics_process(delta: float) -> void:
	var mouseDist := get_global_mouse_position().distance_squared_to($knob.global_position)
	if mouseDist < MAX_DIST and Input.is_action_just_pressed("click"):
		following = true
	if Input.is_action_just_released("click"):
		following = false
		
		
	if following:
		var ang := get_global_mouse_position().angle_to_point( $knob.global_position ) + PI/2
		var d :Vector2= ($knob/knobPoint.position.rotated( $knob.rotation))
		var a = $middlePoint.position.angle_to(d)
		var finalAng :float= range_lerp( a, -3.14, 3.14, 0, 100 )
		print(finalAng)
		var fang :float= lerp_angle( $knob.rotation, ang, 0.3  )
		$knob.rotation = clamp(fang, -2,2)
		emit_signal("turnedKnob", finalAng)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
#		var d :Vector2= ($knob/knobPoint.position.rotated( $knob.rotation)) # cuz we cant just do it with position, position is constant, 
#		var d :Vector2= ($knob/knobPoint.position) # cuz we cant just do it with position, position is constant, 
##		print($knob.rotation)
#		var d :Vector2= $knob/knobPoint.global_position

#		var a :float= $middlePoint.position.angle_to( d )
#		print(d, " ", a)
#		var a :float= $knob/knobPoint.global_position.angle_to(  $middlePoint.global_position )
#		var fang :float= lerp_angle( $knob.rotation, ang, 0.3  )
#		$knob.rotation = clamp(fang, -2,2)
##		emit_signal("turnedKnob", finalAng)
##		if b < 20:
##			knob.rotation = range_lerp(20, -3.14,3.14,0,100)
##		if b > 80:
##			knob.rotation = range_lerp(80, -3.14,3.14,0,100)
#
#range_lerp(75, 0, 100, -1, 1) # Returns 0.5
