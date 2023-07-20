extends Camera2D

@export var tracking_object : Node2D

@export var spring := 0.5
@export var damp := 0.5

var vel : Vector2
var displacement := Vector2.ZERO

func _ready():
	displacement = DisplayServer.window_get_size(0)/2.0


func _process(delta):

	#https://www.youtube.com/watch?v=YBgCUQVDRkw&ab_channel=MrElipteach
	vel = tracking_object.global_position - self.global_position
	var force : Vector2 = (-spring * displacement) - (damp * vel)
	vel += force * delta
	displacement += vel * delta
	
	self.position = displacement
