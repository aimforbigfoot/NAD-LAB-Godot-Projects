extends Node2D


func _ready() -> void:
#	OS.shell_open("www.duckduckgo.com")
	OS.shell_open("https://youtube.com/")
	pass


func _on_Button_pressed() -> void:
#If you saw the video, you saw that I typed www.duckduckgo.com
#but for mobile, you need to use the https: rather than www. 
	
	OS.shell_open("https://duckduckgo.com/") # Works for mobile and pc
#	OS.shell_open("www.duckduckgo.com") Works on pc only
	
	pass # Replace with function body.
