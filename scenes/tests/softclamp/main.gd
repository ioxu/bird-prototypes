extends Node2D

#
# F6 -----------------------------------------------------------------------------------------------
'''
demo
a spring target with soft-clamped limits
'''
#---------------------------------------------------------------------------------------------------




func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN


func _process(delta):
	pass


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			get_tree().quit()

