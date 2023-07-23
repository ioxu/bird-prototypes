extends Node2D
class_name SpringPosition

@export var tracking_object : Node2D

@export var spring := 300.0
@export var damp :=20.0
@export var speed := 5.0

var vel : Vector2
var displacement : Vector2


func _ready():
	pass


func _physics_process(delta):

	#https://www.youtube.com/watch?v=YBgCUQVDRkw&ab_channel=MrElipteach
	var track_pos = tracking_object.global_position
	vel = track_pos - self.global_position

	var force =  -spring * displacement - damp * vel
	vel += force * delta
	displacement +=  vel * delta


	self.global_position += (displacement * speed)

