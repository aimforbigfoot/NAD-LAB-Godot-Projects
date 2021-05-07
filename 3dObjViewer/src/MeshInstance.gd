extends Spatial

var pressed := false

func _input(event: InputEvent) -> void:
	if pressed and event is InputEventMouseMotion:
		rotation.x += event.relative.y*0.005
		$MeshInstance.rotation.y += event.relative.x*0.005



func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		pressed = true
	if Input.is_action_just_released("click"):
		pressed = false


