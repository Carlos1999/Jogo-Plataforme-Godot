extends Node2D

func _ready():
	Global.fase = 1
	pass # Replace with function body.

func _process(delta):
	if($Player.position.y >1500 or Global.lose == true):
		Global.lose = false
		get_tree().change_scene("res://scenes/gameOver.tscn")
	
