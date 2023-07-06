extends CharacterBody2D

#var velocity : Vector2
var speed = 1600.0
var max_lateral_speed = 600.0
var stop_force = 800.0
var jump_force = -250.0

var direction : Vector2
var last_position : Vector2

# Get the gravity from the project settings to be synced with RigidBody nodes.
@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void: 
	last_position = self.position


func _physics_process(delta) -> void:
	# flap
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up") :# and is_on_floor():
		velocity.y = jump_force

	# lateral movement
	var lateral_input = speed*  Input.get_axis("ui_left", "ui_right")

	if abs(lateral_input) < speed * 0.2:
		velocity.x = move_toward(velocity.x, 0, stop_force * delta) 
	else:
		velocity.x += lateral_input * delta

	# clamp to top lateral speed
	velocity.x = clamp(velocity.x, -max_lateral_speed, max_lateral_speed)

	last_position = self.position

	move_and_slide()

	direction = position - last_position

	#rotate( direction.angle() )
	self.set_rotation( direction.angle() )

	# gravity if in air, otherwise, stick
	if is_on_floor() or is_on_ceiling() or is_on_wall():
		if is_on_ceiling(): $contact_surface_label.text = "ceiling"
		if is_on_wall(): $contact_surface_label.text = "wall"
		if is_on_floor(): $contact_surface_label.text = "floor"
		self_modulate = Color.RED
		velocity.y = 0.0
	else:
		$contact_surface_label.text = ""
		velocity.y += gravity * delta
		self_modulate = Color.WHITE

#	if not is_on_floor() or not is_on_ceiling() or not is_on_wall():
#		velocity.y += gravity * delta
#		modulate = Color.WHITE
#	else:
#		if is_on_ceiling(): print("ceiling")
#		if is_on_wall(): print("wall")
#		if is_on_floor(): print("floor")
#		modulate = Color.RED
#		velocity.y = 0.0


func _process(delta) -> void:
	queue_redraw()


func _draw() -> void:
	self.draw_line(Vector2.ZERO, direction.rotated( -self.rotation ) * 5, Color(0.87058824300766, 0.21568627655506, 0.50980395078659, 0.43137255311012), 3, true )













