@tool
extends Node2D

@export var x_inner := 200.0

func _ready():
	pass # Replace with function body.


func _draw():
	draw_line($"../mouse_pointer".global_position, $"../final_point".global_position, Color.GREEN * Color(1, 1, 1, 0.43137255311012), 1.0)
	
	draw_dashed_line(Vector2(x_inner, -2000.0), Vector2(x_inner, 20000.0), Color(1, 0.69411766529083, 0.03921568766236, 0.37254902720451), 3.0, 10.0, false )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()
