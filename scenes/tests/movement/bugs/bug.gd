extends RigidBody2D

@onready var fnl := FastNoiseLite.new()

var age = 0.0 

var nstrength = 20.0

var noise_force : Vector2

var random_id : float


# Called when the node enters the scene tree for the first time.
func _ready():
	random_id = randf_range(-1024.0, 1024.0)
	print("random_id %s"%random_id)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()


func _physics_process(delta) -> void:
	age += delta 
	var nx = remap(fnl.get_noise_1d(position.x + random_id + age * 15), -1.0, 1.0, -1.0, 1.0) * nstrength
	var ny = remap(fnl.get_noise_1d(position.y + random_id + age * 30), -1.0, 1.0, 0.0, 1.0)
	ny *= ny * ny
	ny = remap( ny, 0.0, 1.0, -0.05, 1.0)
	ny *= - nstrength
	noise_force = Vector2( nx, ny )
	linear_velocity += noise_force


func _draw()-> void:
	self.draw_line(Vector2.ZERO, noise_force.rotated( -self.rotation ) * 5, Color(0.87058824300766, 0.21568627655506, 0.50980395078659, 0.43137255311012), 3, true )


func _on_body_entered(body):
	if body is Player:
		print("%s on_body_entered %s"%[self, body])
		queue_free()
