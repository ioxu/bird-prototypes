@tool
extends Node2D


@export var inner_colour := Color(1, 0.69411766529083, 0.03921568766236, 0.37254902720451)
@export var left := 200.0
@export var right := 600.0
@export var top := 200.0
@export var bottom := 400.0

@export var margin_colour := Color(0.32081842422485, 0.6700000166893, 0.27470001578331, 0.54117649793625)
@export var margin_left := 100.0
@export var margin_right := 100.0
@export var margin_top := 100.0
@export var margin_bottom := 100.0

func _ready():
	pass # Replace with function body.


func _draw():
	#draw_line($"../mouse_pointer".global_position, $"../final_point".global_position, Color.GREEN * Color(1, 1, 1, 0.43137255311012), 1.0)

	# inner
	draw_dashed_line(Vector2(left, top), Vector2(left, bottom), inner_colour, 3.0, 10.0, false )
	draw_dashed_line(Vector2(right, top), Vector2(right, bottom), inner_colour, 3.0, 10.0, false )
	draw_dashed_line(Vector2(left, top), Vector2(right, top), inner_colour, 3.0, 10.0, false )
	draw_dashed_line(Vector2(left, bottom), Vector2(right, bottom), inner_colour, 3.0, 10.0, false )

	# margin
	draw_dashed_line(Vector2(left, top) + Vector2(-margin_left, -margin_top) , Vector2(left, bottom) + Vector2(-margin_left, margin_bottom), margin_colour, 3.0, 10.0, false )
	draw_dashed_line(Vector2(right, top) + Vector2(margin_right, -margin_top), Vector2(right, bottom) + Vector2(margin_right, margin_bottom), margin_colour, 3.0, 10.0, false )
	draw_dashed_line(Vector2(left, top) + Vector2(-margin_left, -margin_top), Vector2(right, top) + Vector2(margin_right, -margin_top), margin_colour, 3.0, 10.0, false )
	draw_dashed_line(Vector2(left, bottom) + Vector2(-margin_left, margin_bottom), Vector2(right, bottom) + Vector2(margin_right, margin_bottom), margin_colour, 3.0, 10.0, false )


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()
