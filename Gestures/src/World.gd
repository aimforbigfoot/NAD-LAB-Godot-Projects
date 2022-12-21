extends Node2D

const threshold := 5000
var pressedPos : Vector2
var releasePos : Vector2


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("click"):
		pressedPos = event.position
		$playeronthefly.modulate = Color.red
		print(pressedPos)
	if Input.is_action_just_released("click"):
		releasePos = event.position
		print(releasePos)
		calculateGesture()


func calculateGesture() -> void:
	var d := releasePos - pressedPos
	var dir := Vector2.ZERO
	if d.length_squared() > threshold: 
		print(d)
		if abs(d.x) > abs(d.y):
			print("left or right")
			if d.x < 0:
				print("left")
				dir = Vector2.LEFT
			else:
				print("right")
				dir = Vector2.RIGHT
		else:
			print("up or down")
			if d.y > 0:
				print("down")
				dir = Vector2.DOWN
			else:
				print("up")
				dir = Vector2.UP
				
	dir *= 50
	$playeronthefly.apply_impulse(Vector2.ZERO, dir)
	print("\n")




