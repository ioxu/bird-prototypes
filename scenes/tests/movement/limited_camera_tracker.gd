extends Sprite2D
@export var tracking_object : Node2D

var margin_vertical := 100
var margin_horizontal := 350
@onready var wsize = DisplayServer.window_get_size(0)
@onready var c_limits := {
	left = 0,
	top = 0,
	right = wsize.x,
	bottom = wsize.y
}


func _ready():
	c_limits.left = margin_horizontal
	c_limits.top = margin_vertical
	c_limits.right = wsize.x - margin_horizontal
	c_limits.bottom = wsize.y - margin_vertical
	print("camera limits: ")
	print("    %s"%c_limits.left)
	print("    %s"%c_limits.top)
	print("    %s"%c_limits.right)
	print("    %s"%c_limits.bottom)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var track_pos = tracking_object.global_position
	track_pos.x = clamp( track_pos.x, c_limits.left, c_limits.right )
	track_pos.y = clamp( track_pos.y, c_limits.top, c_limits.bottom )
	self.position = track_pos
