extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var inicial_position_x = position.x
var velocidade = 5
var direcao = 1
var raio_movimento = 300
var max_distance_shoot = 1500
var vendo_player = false
var atacando = false
var bolinha_parada = true
var player_x = 0
var player_y = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	inicial_position_x = position.x
	$AnimatedSprite.flip_h = false
	$fireball/AnimatedSprite.play("stoped")
	pass # Replace with function body.
	
func _process(delta):
	
	var contador = 0
	if(atacando):
		bolinha_parada = false
		contador += 1
		$AnimatedSprite.play("hit")	
				
		$fireball/AnimatedSprite.play("move")				
		$fireball.position.x += (player_x - position.x)/50
		$fireball.position.y += (player_y - position.y)/50
		if($fireball.position.x > max_distance_shoot or $fireball.position.x < (max_distance_shoot*-1) or $fireball.position.y > max_distance_shoot or $fireball.position.y < (max_distance_shoot*-1) ):
			
			
			player_x = Global.position_player_x
			player_y = Global.position_player_y
			$fireball.position.x = 0
			$fireball.position.y = 0
			if(!vendo_player):
				bolinha_parada = true
				$fireball/AnimatedSprite.play("stoped")
				atacando = false
			else:
				$AnimatedSprite.play("move")
				$AnimatedSprite.play("hit")	
		
	if(position.x > inicial_position_x +raio_movimento):
		direcao *= -1
		$AnimatedSprite.flip_h = true
	if(position.x < inicial_position_x):
		direcao *= -1
		$AnimatedSprite.flip_h = false
	if(!vendo_player and !atacando):
		$AnimatedSprite.play("move")	
		position.x += velocidade * direcao
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_sentry_body_entered(body):
	if(body.name == "Player"):
		atacando = true
		if(bolinha_parada):
			player_x = body.position.x 
			player_y = body.position.y
		vendo_player= true

func _on_sentry_body_exited(body):
	if(body.name == "Player"):
		
		vendo_player = false


func _on_fireball_body_entered(body):
	if(body.name == "Player"):
		Global.lose = true
	pass # Replace with function body.
