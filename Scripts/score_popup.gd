extends Node2D

var velocity := Vector2(0, -50)

func setup(amount: int):
	$ScoreLabel.text = "+" + str(amount)

func _process(delta):
	position += velocity * delta
	modulate.a -= delta * 1.5

	if modulate.a <= 0:
		queue_free()
