extends Node2D

@export var spawn_time := 3.0
@export var spawn_radius := 400.0
var timer := 0.0

func _process(delta):
	timer -= delta
	if timer > 0: return
	timer = spawn_time

	var enemy := preload("res://scripts/enemy/enemy.gd").new()
	var angle := randf() * TAU
	enemy.position = Vector2(cos(angle), sin(angle)) * spawn_radius
	get_parent().add_child(enemy)
