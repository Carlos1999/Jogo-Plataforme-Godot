extends Node

var restart = false
var quit_game = false
var coletados = 0
var coletados_bkp = 0
var lose = false
var fase = 0
var endGame = false
var botao_ativado = false
var checkpoint = false
var nascimento_x = 0
var nascimento_y = 0
var vidas = 3

var position_player_x = 0
var position_player_y = 0
var nao_mover = false
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
