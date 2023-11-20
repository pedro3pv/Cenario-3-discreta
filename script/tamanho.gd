extends Node2D

# Function to generate a matrix with size m x n
func generateMatrix(m: int, n: int) -> Array:
	var matrix := []

	# Iterate through rows
	for i in range(m):
		var row := []

		# Iterate through columns
		for j in range(n):
			# Add elements to the row
			row.append(false) #randi() % 10  # You can modify this line to generate different values

		# Add the row to the matrix
		matrix.append(row)

	return matrix

func _on_button_pressed():
	Global.M = $ColorRect/Mtext.text
	Global.N = $ColorRect/Ntext.text
	Global.matrix = generateMatrix(int($ColorRect/Mtext.text), int($ColorRect/Ntext.text))
	get_tree().change_scene_to_file("res://matriz.tscn")
