extends Sprite2D


func _ready():
	pass


func _process(delta):
	pass


func _input(event):
	if event is InputEventMouseMotion:
		self.position = event.position
