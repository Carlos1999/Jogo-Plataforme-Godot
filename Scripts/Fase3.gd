extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player/icones/fim.visible = false
	$Player/icones/Tutorial.visible = false
	$Player/icones/Tutorial2.visible = false
	
	Global.fase = 3
	
	Global.vidas = 5
	Global.coletados_bkp = Global.coletados
	Global.nascimento_x = $Player.position.x 
	Global.nascimento_y = $Player.position.y 
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if(Global.endGame == true):
		$Player/icones/fim.visible = true
		return
	if( Global.lose == true):
		Global.nao_mover = true
		Global.lose = false		
		Global.vidas -= 1
		$Player.position.x = Global.nascimento_x
		$Player.position.y = Global.nascimento_y -200
		
		
		if(Global.vidas ==0):
			Global.coletados = Global.coletados_bkp
			
			get_tree().change_scene("res://scenes/gameOver.tscn")
	
	
	if(Global.botao_ativado and $Player.position.x < 3000):
		$Player/icones/Tutorial.visible = true
	elif(Global.botao_ativado and $Player.position.x > 3000):
		$Player/icones/Tutorial2.visible = true
	else:
		$Player/icones/Tutorial.visible = false
		$Player/icones/Tutorial2.visible = false

