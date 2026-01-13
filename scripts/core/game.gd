extends Node2D

func _process(delta):
	var player = $Player
	var joystick = $Joystick
	player.set_joystick(joystick.output)
