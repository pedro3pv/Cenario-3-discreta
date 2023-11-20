extends Node

var time
var log : Array = []
var carros : Array = []
var M : int = 2
var N : int = 2
var listaDeCarros = [[]]
var matrix : Array = [
		[false, false],
		[false, true],
	]

func ocupar_lugar():
	var M_temp = randi() % M
	var N_temp = randi() % N
	matrix[M_temp][N_temp] = true
	return [M_temp,N_temp]
	
func desocupar_lugar(M,N):
	matrix[M][N] = false

func _ready():
	time = Time.get_datetime_dict_from_system()
	print(time)

func _process(delta):
	var current_time = Time.get_datetime_dict_from_system()
	if (current_time["minute"] - time["minute"] > 0):
		time["minute"] += current_time["minute"] - time["minute"]
	if (time["minute"] >= 60):
		time["minute"] = 0
		time["hour"] += 1
	if (time["hour"] >= 24):
		time["hour"] = time["hour"] - 24
		time["day"] += 1
