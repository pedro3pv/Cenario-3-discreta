extends Node2D
#placas geradas nesse site: https://www.4devs.com.br/gerador_de_placa_automoveis
#convertidas nesse: https://geradornv.com.br/conversor-placa-mercosul/
#mato grosso do sul - MS - placas de test
#HQN7B35
#HQH3C93
#HSJ5A44
#mato grosso - MT
#JZW3A88
#nenhuma da certo, razão, sei lá
#tocantins - TO
#MXD9B75
#tocatins tbm, to entendendo é nada, já olhei codigo umas 5 vezes mais não achei nada

var log = Global.log

func _process(delta):
	$ColorRect/time.text = str(Global.time["day"])+"/"+str(Global.time["month"])+"/"+(str(Global.time["year"])[2]+str(Global.time["year"])[3]) + " " +str(Global.time["hour"]) + ":" + str(Global.time["minute"])

func atualizar_log():
	var text_log = ""
	for placa in log:
		text_log += placa + "\n"
	$ColorRect/RichTextLabel.text = text_log
	Global.log = log

func letra_para_numero(letra: String) -> int:
	# Converte a letra para minúscula para lidar com maiúsculas e minúsculas
	letra = letra.to_lower()

	# Verifica se a string tem exatamente um caractere
	if letra.length() != 1:
		return -1  # Retorna um valor que indica que a entrada é inválida

	# Obtém o código ASCII da letra
	var codigo_ascii = letra[0].to_ascii_buffer()[0]

	# Verifica se o caractere está no intervalo 'a' a 'z'
	if codigo_ascii < "a".to_ascii_buffer()[0] or codigo_ascii > "z".to_ascii_buffer()[0]:
		return -1  # Retorna um valor que indica que a entrada é inválida

	# Retorna o número correspondente no alfabeto (onde 'a' é 0, 'b' é 1, e assim por diante)
	return codigo_ascii - "a".to_ascii_buffer()[0]

func verificarPlaca(placa : String):
	var date = str(Global.time["day"])+"/"+str(Global.time["month"])+"/"+(str(Global.time["year"])[2]+str(Global.time["year"])[3]) + " " +str(Global.time["hour"]) + ":" + str(Global.time["minute"])
	if (typeof(placa) == TYPE_STRING and !placa == ""):
		var contains_placa = false
		if !(Global.carros == []):
			for i in Global.carros:
				if (i[0] == placa):
					contains_placa = true
		if !(contains_placa) and !(letra_para_numero(placa[0]) == -1 or letra_para_numero(placa[1]) == -1 or letra_para_numero(placa[2]) == -1):
			#mato grosso do sul - 6
			#1
			if (letra_para_numero(placa[0]) >= 7 and letra_para_numero(placa[1]) >= 16 and letra_para_numero(placa[2]) >= 5 and letra_para_numero(placa[0]) <= 7 and letra_para_numero(placa[1]) <= 19 and letra_para_numero(placa[2]) <= 22):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Mato Grosso do Sul")
			#2
			elif (letra_para_numero(placa[0]) >= 13 and letra_para_numero(placa[1]) >= 17 and letra_para_numero(placa[2]) <= 5 and letra_para_numero(placa[0]) <= 13 and letra_para_numero(placa[1]) <= 18 and letra_para_numero(placa[2]) >= 3):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Mato Grosso do Sul")
			#3
			elif (letra_para_numero(placa[0]) >= 14 and letra_para_numero(placa[1]) >= 14 and letra_para_numero(placa[2]) >= 6 and letra_para_numero(placa[0]) <= 14 and letra_para_numero(placa[1]) <= 14 and letra_para_numero(placa[2]) <= 20):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Mato Grosso do Sul")
			#4
			elif (letra_para_numero(placa[0]) >= 16 and letra_para_numero(placa[1]) >= 0 and letra_para_numero(placa[2]) >= 0 and letra_para_numero(placa[0]) <= 16 and letra_para_numero(placa[1]) <= 0 and letra_para_numero(placa[2]) <= 25):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Mato Grosso do Sul")
			#5
			elif (letra_para_numero(placa[0]) >= 17 and letra_para_numero(placa[1]) >= 4 and letra_para_numero(placa[2]) >= 22 and letra_para_numero(placa[0]) <= 17 and letra_para_numero(placa[1]) <= 4 and letra_para_numero(placa[2]) <= 25):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Mato Grosso do Sul")
			#6
			elif (letra_para_numero(placa[0]) >= 17 and letra_para_numero(placa[1]) >= 22 and letra_para_numero(placa[2]) >= 0 and letra_para_numero(placa[0]) <= 17 and letra_para_numero(placa[1]) <= 22 and letra_para_numero(placa[2]) <= 9):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Mato Grosso do Sul")
			
			#mato grosso - 8
			#1
			elif (letra_para_numero(placa[0]) >= 9 and letra_para_numero(placa[1]) <= 23 and letra_para_numero(placa[2]) <= 25 and letra_para_numero(placa[0]) <= 10 and letra_para_numero(placa[1]) >= 0 and letra_para_numero(placa[2]) >= 20):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Mato Grosso")
			#2
			elif (letra_para_numero(placa[0]) >= 13 and letra_para_numero(placa[1]) >= 8 and letra_para_numero(placa[2]) <= 24 and letra_para_numero(placa[0]) <= 13 and letra_para_numero(placa[1]) <= 9 and letra_para_numero(placa[2]) >= 22):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Mato Grosso")
			#3
			elif (letra_para_numero(placa[0]) >= 13 and letra_para_numero(placa[1]) >= 15 and letra_para_numero(placa[2]) >= 2 and letra_para_numero(placa[0]) <= 13 and letra_para_numero(placa[1]) <= 15 and letra_para_numero(placa[2]) <= 16):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Mato Grosso")
			#4
			elif (letra_para_numero(placa[0]) >= 13 and letra_para_numero(placa[1]) >= 20 and letra_para_numero(placa[2]) <= 23 and letra_para_numero(placa[0]) <= 13 and letra_para_numero(placa[1]) <= 20 and letra_para_numero(placa[2]) >= 6):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Mato Grosso")
			#5
			elif (letra_para_numero(placa[0]) >= 14 and letra_para_numero(placa[1]) >= 0 and letra_para_numero(placa[2]) >= 15 and letra_para_numero(placa[0]) <= 14 and letra_para_numero(placa[1]) <= 1 and letra_para_numero(placa[2]) <= 18):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Mato Grosso")
			#6
			elif (letra_para_numero(placa[0]) >= 16 and letra_para_numero(placa[1]) >= 1 and letra_para_numero(placa[2]) >= 0 and letra_para_numero(placa[0]) <= 16 and letra_para_numero(placa[1]) <= 2 and letra_para_numero(placa[2]) <= 25):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Mato Grosso")
			#7
			elif (letra_para_numero(placa[0]) >= 17 and letra_para_numero(placa[1]) >= 0 and letra_para_numero(placa[2]) >= 10 and letra_para_numero(placa[0]) <= 17 and letra_para_numero(placa[1]) <= 0 and letra_para_numero(placa[2]) <= 25):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Mato Grosso")
			#8
			elif (letra_para_numero(placa[0]) >= 17 and letra_para_numero(placa[1]) >= 17 and letra_para_numero(placa[2]) >= 8 and letra_para_numero(placa[0]) <= 17 and letra_para_numero(placa[1]) <= 17 and letra_para_numero(placa[2]) <= 25):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Mato Grosso")
			# tocantins - 6
			#1
			elif (letra_para_numero(placa[0]) >= 12 and letra_para_numero(placa[1]) >= 21 and letra_para_numero(placa[2]) >= 6 and letra_para_numero(placa[0]) <= 12 and letra_para_numero(placa[1]) <= 23 and letra_para_numero(placa[2]) <= 11):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Tocantins")
			#2
			elif (letra_para_numero(placa[0]) >= 14 and letra_para_numero(placa[1]) >= 11 and letra_para_numero(placa[2]) >= 7 and letra_para_numero(placa[0]) <= 14 and letra_para_numero(placa[1]) <= 11 and letra_para_numero(placa[2]) <= 13):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Tocantins")
			#3
			elif (letra_para_numero(placa[0]) >= 14 and letra_para_numero(placa[1]) >= 24 and letra_para_numero(placa[2]) >= 0 and letra_para_numero(placa[0]) <= 14 and letra_para_numero(placa[1]) <= 24 and letra_para_numero(placa[2]) <= 2):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Tocantins")
			#4
			elif (letra_para_numero(placa[0]) >= 16 and letra_para_numero(placa[1]) >= 10 and letra_para_numero(placa[2]) >= 0 and letra_para_numero(placa[0]) <= 16 and letra_para_numero(placa[1]) <= 10 and letra_para_numero(placa[2]) <= 12):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Tocantins")
			#5
			elif (letra_para_numero(placa[0]) >= 16 and letra_para_numero(placa[1]) >= 22 and letra_para_numero(placa[2]) >= 0 and letra_para_numero(placa[0]) <= 16 and letra_para_numero(placa[1]) <= 22 and letra_para_numero(placa[2]) <= 5):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Tocantins")
			#6
			elif (letra_para_numero(placa[0]) >= 17 and letra_para_numero(placa[1]) >= 18 and letra_para_numero(placa[2]) >= 0 and letra_para_numero(placa[0]) <= 17 and letra_para_numero(placa[1]) <= 18 and letra_para_numero(placa[2]) <= 5):
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Tocantins")
			else:
				log.append("PLACA: " + placa + " DATA DE ENTRADA: "+ date + " ESTADO: Desconhecido")
			Global.carros.append([placa,Global.time["day"],Global.time["month"],Global.time["year"],Global.time["hour"],Global.time["minute"],Global.ocupar_lugar()])
			atualizar_log()
		elif !(contains_placa):
			push_error("Caracteres Invalidos")
		else:
			push_warning("placa repetida")
	else:
		push_warning("coloque uma placa")

func _on_carro_pressed():
	#print("if (letra_para_numero(placa[0]) >= "+str(letra_para_numero($ColorRect/TextEdit.text[0]))+" and letra_para_numero(placa[1]) >= "+str(letra_para_numero($ColorRect/TextEdit.text[1]))+" and letra_para_numero(placa[2]) >= "+str(letra_para_numero($ColorRect/TextEdit.text[2]))+" and letra_para_numero(placa[0]) <= "+str(letra_para_numero($ColorRect/TextEdit.text[3]))+" and letra_para_numero(placa[1]) <= "+str(letra_para_numero($ColorRect/TextEdit.text[4]))+" and letra_para_numero(placa[2]) <= "+str(letra_para_numero($ColorRect/TextEdit.text[5]))+"):")
	verificarPlaca($ColorRect/TextEdit.text)
#	print(letra_para_numero($ColorRect/TextEdit.text[0]))
#	print(letra_para_numero($ColorRect/TextEdit.text[1]))
#	print(letra_para_numero($ColorRect/TextEdit.text[2]))
#	print(letra_para_numero($ColorRect/TextEdit.text[3]))
#	print(letra_para_numero($ColorRect/TextEdit.text[4]))
#	print(letra_para_numero($ColorRect/TextEdit.text[5]))


func _on_matriz_pressed():
	get_tree().change_scene_to_file("res://matriz.tscn")


func _on_hora_pressed():
	Global.time["hour"] += 1


func _on_hora_2_pressed():
	Global.time["hour"] += 3


func _on_remover_pressed():
	var date = str(Global.time["day"])+"/"+str(Global.time["month"])+"/"+(str(Global.time["year"])[2]+str(Global.time["year"])[3]) + " " +str(Global.time["hour"]) + ":" + str(Global.time["minute"])
	if (typeof($ColorRect/TextEdit.text[0]) == TYPE_STRING):
		var contains_placa = 0
		if !(Global.carros == []):
			for i in range(Global.carros.size()):
				if (Global.carros[i][0] == $ColorRect/TextEdit.text):
					contains_placa = i
		var preco = 0.00
		var permaneceu = [Global.time["hour"] - Global.carros[contains_placa][4],Global.time["minute"] - Global.carros[contains_placa][5]]
		if ((Global.time["minute"] - Global.carros[contains_placa][5] > 15) or (Global.time["hour"] - Global.carros[contains_placa][4] > 0)):
			Global.carros[contains_placa][4] = Global.time["hour"] - Global.carros[contains_placa][4]
			if (Global.time["minute"] - Global.carros[contains_placa][5] > 15):
				Global.carros[contains_placa][5] = Global.time["minute"] - Global.carros[contains_placa][5]
			preco += 10.00
			Global.carros[contains_placa][5] -= 15
			Global.carros[contains_placa][4] -= 3
			if (Global.carros[contains_placa][4] > 0):
				preco += (2.50 * Global.carros[contains_placa][4])
				if (Global.carros[contains_placa][5] > 0):
					preco += 2.50
		log.append("PLACA: "+Global.carros[contains_placa][0]+" SAIDA: "+date+" PAGOU: "+"R$ "+str(preco)+" permaneceu: "+str(permaneceu[0])+":"+str(permaneceu[1]))
		Global.desocupar_lugar(Global.carros[contains_placa][6][0],Global.carros[contains_placa][6][1])
		Global.carros.remove_at(contains_placa)
		atualizar_log()


func _on_minute_pressed():
	Global.time["minute"] += 5
