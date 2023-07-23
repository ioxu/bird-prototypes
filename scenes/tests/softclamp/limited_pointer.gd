extends Sprite2D

@export var position_limit : Node2D
@export var target_position : Node2D

func _ready():
	pass # Replace with function body.


func _process(delta):
	self.position = position_limit.get_softclamped_position( target_position.position )
