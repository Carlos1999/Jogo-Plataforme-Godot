extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("desativado")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_button_body_entered(body):
	if(body.name == "Player"):
		$AnimatedSprite.play("ativado")
		Global.checkpoint = true
		Global.nascimento_x = position.x
		Global.nascimento_y = position.y
		
	
	
