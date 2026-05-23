extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_interval := 1.0
@export var spawn_width := 400.0

var timer := 0.0

func _process(delta):
	timer += delta

	if timer >= spawn_interval:
		timer = 0
		spawn_enemy()
		
func spawn_enemy():
	var enemy = enemy_scene.instantiate()

	# random X at top of screen
	var x = randf_range(0, spawn_width)
	var y = -50

	enemy.global_position = Vector2(x, y)

	add_child(enemy)
