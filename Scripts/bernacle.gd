extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var local_inicial = transform.x
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("move")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_bernacle_body_entered(body):
	if(body.name == "Player"):
		Global.lose = true
