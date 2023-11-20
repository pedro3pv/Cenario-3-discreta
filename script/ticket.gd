extends Node2D


func _ready():
	$ColorRect/ColorRect/Label/Placa.text = Global.temp_placa
	var contains_placa = null
	if !(Global.carros == []):
		for i in range(Global.carros.size()):
			if (Global.carros[i][0] == $ColorRect/ColorRect/Label/Placa.text):
				contains_placa = i
	$"ColorRect/ColorRect/hora-de-permanecia".text = Global.carros[contains_placa][2]
	$"ColorRect/ColorRect/hora-de-entrada".text = Global.carros[contains_placa][3]
	$"ColorRect/ColorRect/hora-de-saida".text = Global.carros[contains_placa][4]
	$ColorRect/ColorRect/preco.text = str(Global.carros[contains_placa][5])


func _on_button_pressed():
	get_tree().change_scene_to_file("res://placa.tscn")
