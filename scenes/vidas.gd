extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Global.vidas == 3):
		$coracao_1.play("ativado")	
		$coracao_2.play("ativado")
		$coracao_3.play("ativado")
	if(Global.vidas == 2):
		$coracao_1.play("ativado")	
		$coracao_2.play("ativado")
		$coracao_3.play("desativado")
	if(Global.vidas == 1):
		$coracao_1.play("ativado")	
		$coracao_2.play("desativado")
		$coracao_3.play("desativado")
		
	pass

