extends Node2D

@export var hit_cooldown := 0.5
var timer := 0.0

func _physics_process(delta):
	timer -= delta
	if timer > 0:
		return

	for enemy in get_tree().get_nodes_in_group("Enemy"):
		if enemy.global_position.distance_to($Player.global_position) < 20:
			$Player.take_damage(enemy.damage)
			timer = hit_cooldown
			break
