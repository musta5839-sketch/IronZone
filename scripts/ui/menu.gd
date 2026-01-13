extends Control

func _ready():
	visible = true
	get_tree().paused = true

func _on_start_pressed():
	get_tree().paused = false
	visible = false

func _on_retry_pressed():
	get_tree().reload_current_scene()
