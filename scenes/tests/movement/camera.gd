extends Camera2D

@export var tracking_object : Node2D

#@export var spring := 0.5
#@export var damp := 0.5
#
#var vel : Vector2
#var displacement := Vector2.ZERO
#
#var margin_vertical := 100
#var margin_horizontal := 450
#
#@onready var wsize = DisplayServer.window_get_size(0)
#@onready var c_limits := {
#	left = 0,
#	top = 0,
#	right = wsize.x,
#	bottom = wsize.y
#}


func _ready():
#	displacement = wsize/2.0
#	c_limits.left = margin_horizontal
#	c_limits.top = margin_vertical
#	c_limits.right = wsize.x - margin_horizontal
#	c_limits.bottom = wsize.y - margin_vertical
#	print("camera limits: ")
#	print("    %s"%c_limits.left)
#	print("    %s"%c_limits.top)
#	print("    %s"%c_limits.right)
#	print("    %s"%c_limits.bottom)
	pass

func _process(delta):
#
#	#https://www.youtube.com/watch?v=YBgCUQVDRkw&ab_channel=MrElipteach
#	var track_pos = tracking_object.global_position
#	track_pos.x = clamp( track_pos.x, c_limits.left, c_limits.right )
#	track_pos.y = clamp( track_pos.y, c_limits.top, c_limits.bottom )
#	vel =  track_pos - self.global_position
#	var force : Vector2 = (-spring * displacement) - (damp * vel)
#	vel += force * delta
#	displacement += vel * delta
#
#	self.position = displacement
	self.global_position = tracking_object.global_position
