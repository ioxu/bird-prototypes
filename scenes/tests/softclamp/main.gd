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
	#$fps_label.text = "%0.2f"%Engine.get_frames_per_second()
	pass
	

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			get_tree().quit()

