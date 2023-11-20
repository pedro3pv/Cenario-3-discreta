extends ScrollContainer

func _ready():
	var vbox = VBoxContainer.new()
	add_child(vbox)

	# Adicione algumas imagens ao VBoxContainer
	for i in range(20):  # Adicione quantas imagens você precisar
		var texture = preload("res://sprites/ticket.png")  # Substitua pelo caminho da sua imagem
		var sprite = Sprite2D.new()
		sprite.position.x += 150
		sprite.position.y += 150 * i
		sprite.texture = texture
		vbox.add_child(sprite)
	
