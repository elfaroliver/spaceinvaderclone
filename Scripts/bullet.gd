extends CharacterBody2D

var pos: Vector2
var rota: float
var speed := 100.0

func _ready():
	global_position = pos
	rotation = rota

func _physics_process(delta):
	velocity = Vector2.UP.rotated(rotation) * speed
	move_and_slide()
