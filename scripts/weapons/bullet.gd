extends Area2D

@export var speed := 600.0
@export var damage := 20

func _ready():
	var shape := CollisionShape2D.new()
	shape.shape = CircleShape2D.new()
	shape.shape.radius = 6
	add_child(shape)
	connect("body_entered", _on_body_entered)

func _physics_process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta

func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		body.take_damage(damage)
		queue_free()
