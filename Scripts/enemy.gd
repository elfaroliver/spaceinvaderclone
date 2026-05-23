extends Area2D

@export var health := 3
@export var speed := 100.0

func _process(delta):
	position.y += speed * delta
	
func _ready():
	global_position.y = -50  # start off-screen

func take_damage(amount := 1):
	health -= amount

	if health <= 0:
		die()

func die():
	queue_free()
