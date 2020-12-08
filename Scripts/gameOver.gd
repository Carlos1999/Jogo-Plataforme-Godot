extends Control


func _ready():
	pass 



func _on_Button_pressed():
	if(Global.fase == 1):
		get_tree().change_scene("res://scenes/Fase1.tscn")
	if(Global.fase == 2):
		get_tree().change_scene("res://scenes/Fase2.tscn")

func _on_Button2_pressed():
	get_tree().quit()
