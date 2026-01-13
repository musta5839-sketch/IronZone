extends Node2D

func _physics_process(delta):
	for body in get_tree().get_nodes_in_group("Enemy"):
		if body.global_position.distance_to($Player.global_position) < 20:
			$Player.take_damage(body.damage)
