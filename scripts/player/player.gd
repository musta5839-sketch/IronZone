extends CharacterBody2D

@export var speed := 220.0
@export var max_hp := 100
var hp := 100
var joystick := Vector2.ZERO

func set_joystick(dir: Vector2):
	joystick = dir

func take_damage(amount):
	hp -= amount
	print("HP:", hp)
	if hp <= 0:
		queue_free()

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
