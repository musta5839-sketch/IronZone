extends Control

@export var max_width := 200.0
var player := null

func _ready():
	player = get_tree().get_root().get_node("Main/Player")

func _process(delta):
	if not player: return
	var ratio := clamp(float(player.hp) / float(player.max_hp), 0.0, 1.0)
	size.x = max_width * ratio
