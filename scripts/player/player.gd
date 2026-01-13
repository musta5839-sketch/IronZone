extends CharacterBody2D

@export var speed := 220.0
var joystick := Vector2.ZERO

func set_joystick(dir: Vector2):
	joystick = dir

func _physics_process(delta):
	var dir := joystick

	if dir == Vector2.ZERO:
		if Input.is_action_pressed("ui_right"):
			dir.x += 1
		if Input.is_action_pressed("ui_left"):
			dir.x -= 1
		if Input.is_action_pressed("ui_down"):
			dir.y += 1
		if Input.is_action_pressed("ui_up"):
			dir.y -= 1

	if dir != Vector2.ZERO:
		dir = dir.normalized()

	velocity = dir * speed
	move_and_slide()
