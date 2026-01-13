extends CharacterBody2D

@export var speed := 220.0
@export var max_hp := 100
var hp := 100
var joystick := Vector2.ZERO

func set_joystick(dir: Vector2):
	joystick = dir

func shoot():
	var bullet = preload("res://scripts/weapons/bullet.gd").new()
	bullet.position = global_position
	bullet.rotation = rotation
	get_parent().add_child(bullet)

func take_damage(amount):
	hp -= amount
	print("HP:", hp)
	if hp <= 0:
		get_tree().reload_current_scene()

func _physics_process(delta):
	var dir := joystick

	if dir != Vector2.ZERO:
		rotation = dir.angle()
		dir = dir.normalized()

	velocity = dir * speed
	move_and_slide()
