extends KinematicBody2D

export(float) var gravity = 40
export(int) var speed = 700
export(int) var jump_force = 1200
var velocity = Vector2()
var pode_pular_na_parece = false
var para_direita = false
var para_esquerda = false
var elapsed_time = 0
var delay = 0.3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	elapsed_time += delta	
	if(elapsed_time > delay):
		elapsed_time -= delay
		pode_pular_na_parece = true
		para_direita = false
		para_esquerda = false
			
	$icones/pontuacao.text = "Pontuação: " +str(Global.coletados)
	var pulou_na_parede = false
	
	if(para_direita and pode_pular_na_parece ==false):
		velocity.x = +speed
		pulou_na_parede = true
		$AnimatedSprite.flip_h = false
	elif(para_esquerda and pode_pular_na_parece ==false):
		velocity.x = -speed
		pulou_na_parede = true
		$AnimatedSprite.flip_h = true
		
	if(is_on_floor() and Input.is_action_pressed("jump")):
		velocity.y = -jump_force
		$AnimatedSprite.play("jump")
		
	if(is_on_wall() and Input.is_action_pressed("jump") and pode_pular_na_parece):
		pode_pular_na_parece = false
		elapsed_time = 0
		$AnimatedSprite.play("jump_wall")  
		
		if($AnimatedSprite.flip_h == true and Input.is_action_pressed("ui_left")):
			para_direita = true
			velocity.y = -jump_force+300
			
		elif($AnimatedSprite.flip_h == false and Input.is_action_pressed("ui_right")):
			para_esquerda = true
			velocity.y = -jump_force+300
		yield(get_tree().create_timer(2), "timeout") 
		pulou_na_parede = true
	if(not pulou_na_parede):
		if(Input.is_action_pressed("ui_left")):
			velocity.x = -speed
			$AnimatedSprite.flip_h = true
			if(is_on_floor()):		
				$AnimatedSprite.play("walk")
			else:
				$AnimatedSprite.play("jump")
		elif(Input.is_action_pressed("ui_right")):
			velocity.x = speed	
			$AnimatedSprite.flip_h = false
			if(is_on_floor()):		
				$AnimatedSprite.play("walk")
			else:
				$AnimatedSprite.play("jump")
		else:
			velocity.x = 0
			if(is_on_floor()):
				$AnimatedSprite.play("idle")
		
	
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_Area2D_body_entered(body):
	print(body.name)
	if(body.name == "Caixa Exclamacao"):
		print(Global.coletados)
		queue_free()
	
