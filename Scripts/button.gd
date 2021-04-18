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
		Global.botao_ativado = true
		$AnimatedSprite.play("ativado")
	

func _on_button_body_exited(body):
	if(body.name == "Player"):
		Global.botao_ativado = false
		$AnimatedSprite.play("desativado")
	
