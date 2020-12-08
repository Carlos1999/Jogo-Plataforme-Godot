extends KinematicBody2D

export(float) var gravity = 30
export(int) var speed = 700
export(int) var jump_force = 1300
var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	$icones/pontuacao.text = "Pontuação: " +str(Global.coletados)
	if(is_on_floor() and Input.is_action_pressed("jump")):
		velocity.y = -jump_force
		$AnimatedSprite.play("jump")
		
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
