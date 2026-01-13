extends CharacterBody2D

@export var speed := 120.0
@export var damage := 10
@export var hp := 30
var player := null
var kills := null

func _ready():
	add_to_group("Enemy")
	player = get_tree().get_root().get_node("Main/Player")
	kills = get_tree().get_root().get_node("Main/Kills")

func take_damage(d):
	hp -= d
	if hp <= 0:
		if kills: kills.add_kill()
		queue_free()

func _physics_process(delta):
	if player:
		var dir = (player.global_position - global_position).normalized()
		velocity = dir * speed
		move_and_slide()
