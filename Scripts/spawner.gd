extends Node2D

@export var enemy_basic: PackedScene
@export var enemy_fast: PackedScene

var fast_timer := 0.0
var slow_timer := 0.0

var fast_interval := 1.75
var slow_interval := 5.0

var min_x := 0.0
var max_x := 0.0


func _ready():
	var screen_width = get_viewport_rect().size.x
	var margin = screen_width * 0.1

	min_x = margin
	max_x = screen_width - margin

func _process(delta):
	fast_timer += delta
	slow_timer += delta

	# FAST SPAWN (every 1.75s)
	if fast_timer >= fast_interval:
		fast_timer = 0
		print("Spawn 1.75sec")
		spawn_enemy(enemy_basic)

	# SLOW SPAWN (every 5s)
	if slow_timer >= slow_interval:
		slow_timer = 0
		print("Spawn 5sec")
		spawn_enemy(enemy_fast)


func spawn_enemy(scene: PackedScene):
	var enemy = scene.instantiate()

	enemy.global_position = Vector2(
		randf_range(min_x, max_x),
		-50
	)

	add_child(enemy)
