extends Spatial


func _ready() -> void:
	$Camera/Node2D/Knob.connect("turnedKnob", self, "turnKnob")
	$Camera/Node2D/Knob2.connect("turnedKnob", self, "turnKnob2")

func turnKnob(f:float) -> void:
	$MeshInstance.rotation_degrees.x = f
	print(f)

func turnKnob2(f:float) -> void:
	$MeshInstance.rotation_degrees.y = f
	print(f)
