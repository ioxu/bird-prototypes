extends Sprite2D
class_name SpringPosition

@export var tracking_object : Node2D

@export var spring := 300.0
@export var damp :=20.0
@export var speed := 5.0

var vel : Vector2
var displacement : Vector2


func _ready():
	#displacement = tracking_object.position
	#self.position = displacement
	pass


func _process(delta):

	#https://www.youtube.com/watch?v=YBgCUQVDRkw&ab_channel=MrElipteach
	var track_pos = tracking_object.global_position
#	track_pos.x = clamp( track_pos.x, c_limits.left, c_limits.right )
#	track_pos.y = clamp( track_pos.y, c_limits.top, c_limits.bottom )
	vel = track_pos - self.global_position

	var force =  -spring * displacement - damp * vel
	vel += force * delta
	displacement += ( vel * delta ) * speed
	
	self.global_position += displacement

