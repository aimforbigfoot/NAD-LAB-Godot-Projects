extends Node2D

var file := File.new()
var path := "user://arrtemp.dat"
var thicc_arr := []
var do_the_array := false

func _ready() -> void:
	if do_the_array:
		randomize()
		for i in 100000:
	#		print(i)
			thicc_arr.append(1)
	#		thicc_arr.append(10)
	#		thicc_arr.append(randi())
		file.open(path, File.WRITE)
		file.store_var(thicc_arr)
		file.close()
		print(thicc_arr)
	else:
		print("nothing to be done")
