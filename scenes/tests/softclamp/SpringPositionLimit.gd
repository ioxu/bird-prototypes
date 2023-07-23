@tool
extends Node2D


@export var inner_colour := Color(1, 0.69411766529083, 0.03921568766236, 0.37254902720451)
@export var left := 230.0
@export var right := 640.0
@export var top := 200.0
@export var bottom := 400.0

@export var margin_colour := Color(0.32081842422485, 0.6700000166893, 0.27470001578331, 0.54117649793625)
@export var margin_left := 80.0
@export var margin_right := 80.0
@export var margin_top := 80.0
@export var margin_bottom := 80.0

@export var outer_margin_colour := Color(0.83999997377396, 0.32339999079704, 0.15119999647141, 0.54117649793625)
@export var outer_margin_left := 160.0
@export var outer_margin_right := 160.0
@export var outer_margin_top := 160.0
@export var outer_margin_bottom := 160.0



func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()


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

	# outer margin
	draw_dashed_line(Vector2(left, top) + Vector2(-outer_margin_left, -outer_margin_top) , Vector2(left, bottom) + Vector2(-outer_margin_left, outer_margin_bottom), outer_margin_colour, 3.0, 10.0, false )
	draw_dashed_line(Vector2(right, top) + Vector2(outer_margin_right, -outer_margin_top), Vector2(right, bottom) + Vector2(outer_margin_right, outer_margin_bottom), outer_margin_colour, 3.0, 10.0, false )
	draw_dashed_line(Vector2(left, top) + Vector2(-outer_margin_left, -outer_margin_top), Vector2(right, top) + Vector2(outer_margin_right, -outer_margin_top), outer_margin_colour, 3.0, 10.0, false )
	draw_dashed_line(Vector2(left, bottom) + Vector2(-outer_margin_left, outer_margin_bottom), Vector2(right, bottom) + Vector2(outer_margin_right, outer_margin_bottom), outer_margin_colour, 3.0, 10.0, false )


func get_softclamped_position( inpos : Vector2 ) -> Vector2:
	var outpos := inpos
	var xpos = 0.0
	var ypos = 0.0
	if inpos.x > right:
		xpos = remap( inpos.x, right, right + outer_margin_right, 0.0, 1.0 )
		xpos = clamp( xpos, 0.0, 1.0 )
		xpos = ease_out(xpos)
		outpos.x = right + ( xpos * margin_right )
	elif inpos.x < left:
		xpos = remap( inpos.x, left, left - outer_margin_left, 0.0, 1.0 )
		xpos = clamp( xpos, 0.0, 1.0 )
		xpos = ease_out(xpos)
		outpos.x = left - ( xpos * margin_left )
	
	if inpos.y > bottom:
		ypos = remap( inpos.y, bottom, bottom + outer_margin_bottom, 0.0, 1.0 )
		ypos = clamp(ypos, 0.0, 1.0)
		ypos = ease_out(ypos)
		outpos.y = bottom + (ypos * margin_bottom)
	elif inpos.y < top:
		ypos = remap( inpos.y, top, top - outer_margin_top, 0.0, 1.0 )
		ypos = clamp(ypos, 0.0, 1.0)
		ypos = ease_out(ypos)
		outpos.y = top - (ypos * margin_top)



	return outpos


func ease_out(e: float) -> float:
	return (e - 1) * (e - 1) * (e - 1) + 1





