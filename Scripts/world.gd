extends Node2D

var score := 0
var time_alive := 0.0

@onready var score_label = $ScoreLabel
@onready var timer_label = $TimerLabel

@export var popup_scene: PackedScene

func add_score(amount):
	score += amount
	score_label.text = "Score: " + str(score)
	
	print("GAINED: ", amount, "TOTAL: ", score)
	
func _process(delta):
	time_alive += delta
	update_timer_label()
	
func update_timer_label():
	timer_label.text = "Time: " + str(int(time_alive))
	
#func update_timer_label():
	#var seconds = int(time_alive) % 60
	#var minutes = int(time_alive) / 60
#
	#timer_label.text = "Time: %02d:%02d" % [minutes, seconds]
