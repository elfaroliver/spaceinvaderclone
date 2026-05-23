extends Area2D

var pos: Vector2
var rota: float
var speed := 100.0

func _ready():
	global_position = pos
	rotation = rota

func _physics_process(delta):
	#position += Vector2.UP.rotated(rotation) * speed * delta
	position += Vector2.UP * speed * delta

func _on_area_entered(area):
	print("COLLIDED")
	if area.is_in_group("enemy"):
		area.take_damage(1)
		queue_free()
