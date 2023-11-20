extends Node

var temp_placa
var time
var time_real
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
	if !(matrix[M_temp][N_temp]):
		matrix[M_temp][N_temp] = true
		return [M_temp,N_temp]
	else:
		ocupar_lugar()
	
func desocupar_lugar(M,N):
	matrix[M][N] = false
