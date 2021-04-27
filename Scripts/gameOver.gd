extends Control


func _ready():
	pass 



func _on_Button_pressed():
	if(Global.fase == 1):
		get_tree().change_scene("res://scenes/Fase1.tscn")
	if(Global.fase == 2):
		Global.endGame = false
		get_tree().change_scene("res://scenes/Fase2.tscn")
	if(Global.fase == 3):
		Global.endGame = false
		get_tree().change_scene("res://scenes/Fase3.tscn")
	if(Global.fase == 4):
		Global.endGame = false
		get_tree().change_scene("res://scenes/Fase4.tscn")

func _on_Button2_pressed():
	get_tree().quit()
