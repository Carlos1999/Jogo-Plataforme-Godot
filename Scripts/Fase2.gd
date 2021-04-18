extends Node2D

func _ready():
	Global.fase = 2
	Global.vidas = 5
	Global.coletados_bkp = Global.coletados
	Global.nascimento_x = $Player.position.x 
	Global.nascimento_y = $Player.position.y 
	$Player/icones/Tutorial.visible = false	
	#get_tree().change_scene("res://scenes/Fase1.tscn")
	pass # Replace with function body.

func _process(delta):
	if(Global.endGame == true):
		Global.endGame = false
		get_tree().change_scene("res://scenes/Fase3.tscn")
	if( Global.lose == true):
		Global.nao_mover= true
		Global.lose = false		
		Global.vidas -= 1
		$Player.position.x = Global.nascimento_x
		$Player.position.y = Global.nascimento_y -200
		if(Global.vidas ==0):
			Global.coletados = Global.coletados_bkp
			
			get_tree().change_scene("res://scenes/gameOver.tscn")
	if(Global.botao_ativado):
		$Player/icones/Tutorial.visible = true
	else:
		$Player/icones/Tutorial.visible = false


