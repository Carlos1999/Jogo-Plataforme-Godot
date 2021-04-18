extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var inicial_position_x = position.x
var velocidade = 10
var direcao = 1
var raio_movimento = 500
# Called when the node enters the scene tree for the first time.
func _ready():
	inicial_position_x = position.x
	$AnimatedSprite.flip_h = false
	pass # Replace with function body.
	
func _process(delta):
	
	if(position.x > inicial_position_x +raio_movimento):
		direcao *= -1
		$AnimatedSprite.flip_h = false
	if(position.x < inicial_position_x):
		direcao *= -1
		$AnimatedSprite.flip_h = true
	position.x += velocidade * direcao
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_bee_body_entered(body):
	if(body.name == "Player"):
		Global.lose = true
	pass # Replace with function body.
