extends Node2D

signal smthYouWant

func _ready() -> void:
	$textBtn.connect("pressed",self,"textBtn")
	$helloBtn.connect("pressed",self,"helloBtn")
	connect("smthYouWant",self,"smthYouWantFunc")

func textBtn() -> void:
	print("yes I got pressed")
	emit_signal("smthYouWant",["asdf",[1,2,3]])

func helloBtn() -> void:
	print("hello Btn got pressed")
	emit_signal("smthYouWant",["asdfsdf","sdafsdf","sdafsdaf",[34],324,42])


func smthYouWantFunc(arg1) -> void:
	print(arg1)



