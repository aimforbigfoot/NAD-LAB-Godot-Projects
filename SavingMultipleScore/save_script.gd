extends Node

var path := "moreSavingStuff.dat"
var file := File.new()
var things_to_save := [0, Vector2.ZERO]

func is_file_there() -> bool:
	var bl := false
	if file.file_exists(path):
		bl = true
	return bl


func save_val() -> void: 
	file.open(path, File.WRITE)
	file.store_var(things_to_save)
	file.close()


func load_val():
	var tmp
	file.open(path, File.READ)
	tmp = file.get_var()
	print(tmp)
	file.close()
	return tmp
