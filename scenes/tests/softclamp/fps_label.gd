extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = "%0.2f"%Engine.get_frames_per_second()
