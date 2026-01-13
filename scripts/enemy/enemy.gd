extends CharacterBody2D

@export var speed := 120.0
@export var damage := 10
var player := null

func _ready():
	player = get_tree().get_root().get_node("Main/Player")

func _physics_process(delta):
	if player:
		var dir = (player.global_position - global_position).normalized()
		velocity = dir * speed
		move_and_slide()
