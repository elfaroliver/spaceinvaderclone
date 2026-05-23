extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_interval := 1.0

var timer := 0.0
var min_x := 0.0
var max_x := 0.0

func _ready():
	var screen_width = get_viewport_rect().size.x
	var margin = screen_width * 0.1

	min_x = margin
	max_x = screen_width - margin


func _process(delta):
	timer += delta

	if timer >= spawn_interval:
		timer = 0
		spawn_enemy()


func spawn_enemy():
	var enemy = enemy_scene.instantiate()

	var x = randf_range(min_x, max_x)
	var y = -50

	enemy.global_position = Vector2(x, y)

	add_child(enemy)
