extends Control

@export var radius := 80.0
var dragging := false
var output := Vector2.ZERO

func _gui_input(event):
	if event is InputEventScreenTouch:
		dragging = event.pressed
		if not dragging:
			output = Vector2.ZERO
			queue_redraw()

	if event is InputEventScreenDrag and dragging:
		var center := size / 2
		output = (event.position - center).limit_length(radius) / radius
		queue_redraw()

func _draw():
	var center := size / 2
	draw_circle(center, radius, Color(1,1,1,0.2))
	draw_circle(center + output * radius, 20, Color(1,1,1,0.6))
