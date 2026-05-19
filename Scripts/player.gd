extends CharacterBody2D

@export var speed = 7.5

var bullet_path = preload("res://Scenes/bullet.tscn")

var can_shoot = true

func _physics_process(delta):
	#var vert_input = Input.get_axis("Up", "Down")
	var horiz_input = Input.get_axis("Left", "Right")
	
	var move_direction = Vector2(horiz_input,0)
	move_and_collide(move_direction * speed)
	
	if Input.is_action_pressed("Shoot") and can_shoot:
		fire1()
		fire2()
		can_shoot = false
		$ShootTimer.start()
		
	var screen_size = get_viewport_rect().size

	var margin = 32

	position.x = clamp(position.x, margin, screen_size.x - margin)
	position.y = clamp(position.y, margin, screen_size.y - margin)
		
func _on_shoot_timer_timeout():
	can_shoot = true
	
func fire1():
	var bullet = bullet_path.instantiate()
	bullet.pos=$RightGun.global_position
	bullet.rota=global_rotation
	get_parent().add_child(bullet)
	
func fire2():
	var bullet = bullet_path.instantiate()
	bullet.pos=$LeftGun.global_position
	bullet.rota=global_rotation
	get_parent().add_child(bullet)
	
