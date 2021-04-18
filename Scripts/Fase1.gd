extends Node2D

func _ready():
	Global.fase = 1
	Global.vidas = 3
	$Player/icones/Tutorial.visible = false
	$Player/icones/Tutorial2.visible = false
	
	Global.nascimento_x = $Player.position.x 
	Global.nascimento_y = $Player.position.y 
		
	#get_tree().change_scene("res://scenes/Fase3.tscn")
	pass # Replace with function body.

func _process(delta):
	if( Global.lose == true):
		Global.lose = false		
		Global.vidas -= 1
		$Player.position.x = Global.nascimento_x
		$Player.position.y = Global.nascimento_y -200
		if(Global.vidas ==0):
			Global.coletados = Global.coletados_bkp
			
			get_tree().change_scene("res://scenes/gameOver.tscn")
	if(Global.botao_ativado and $Player.position.x < 6000):
		$Player/icones/Tutorial.visible = true
	elif(Global.botao_ativado and $Player.position.x > 6000):
		$Player/icones/Tutorial2.visible = true
	else:
		$Player/icones/Tutorial.visible = false
		$Player/icones/Tutorial2.visible = false

