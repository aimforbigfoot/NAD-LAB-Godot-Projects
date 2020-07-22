extends Node2D

var file := File.new()
var path := "user://arrtemp.dat"
var thicc_arr :PoolIntArray= []
var do_the_array := false

func _ready() -> void:
	pass


func _on_Button_pressed() -> void:
	oh_no()


func _on_Timer_timeout() -> void:
	oh_no()


func oh_no() -> void:
	randomize()
	for i in 9000000:
#		print(i)
		thicc_arr.append(1)
#		thicc_arr.append(10)
#		thicc_arr.append(randi())
	file.open(path, File.WRITE)
	file.store_var(thicc_arr)
	file.close()
