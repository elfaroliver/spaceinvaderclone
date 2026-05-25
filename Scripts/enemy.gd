extends Area2D

@export var health := 2
@export var speed := 100.0
@export var score := 100

func _process(delta):
	position.y += speed * delta
	
func _ready():
	global_position.y = -50  # start off-screen

func take_damage(amount := 1):
	health -= amount

	if health <= 0:
		die()

func die():
	get_tree().current_scene.add_score(score)
	spawn_popup()
	queue_free()
	
#func spawn_popup():
	#var popup = get_tree().current_scene.popup_scene.instantiate()
	#get_tree().current_scene.add_child(popup)
#
	#popup.global_position = global_position
	#popup.call_deferred("setup", score)
	
func spawn_popup():
	var popup = get_tree().current_scene.popup_scene.instantiate()

	get_tree().current_scene.add_child(popup)

	popup.global_position = global_position
	popup.setup(score)
	
#func spawn_popup():
	#var popup = get_tree().current_scene.popup_scene.instantiate()
#
	#get_tree().current_scene.add_child(popup)
	#print("ENEMY POS:", global_position)
	#popup.global_position = global_position
	#print("POPUP POS:", popup.global_position)
	#popup.setup(score)
	
