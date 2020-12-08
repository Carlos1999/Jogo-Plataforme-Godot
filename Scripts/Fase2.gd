extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player/icones/fim.visible = false
	Global.fase = 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if(Global.endGame == true):
		$Player/icones/fim.visible = true
	if($Player.position.y >1500 or Global.lose == true):
		Global.lose = false
		get_tree().change_scene("res://scenes/gameOver.tscn")
		$Player/icones/fim.visible = false
