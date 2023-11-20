extends Node2D

# Parâmetros
var rows = Global.M
var cols = Global.N
var sprite_width = 180
var sprite_height = 317
var spacing = 10
var min_scale = 0.000000000000000001
var max_iterations = 10000

# Armazena uma referência à Camera2D
var camera2d : Camera2D

# Armazena a escala inicial da Camera2D
var initial_camera_scale : Vector2
var initial_camera_position : Vector2

func _ready():
	# Obtém a resolução da Camera2D
	var camera_resolution = Vector2(1152, 648)  # Substitua pelos valores reais da sua Camera2D

	# Cria um nó Camera2D (se não existir) e adiciona-o como filho
	if not has_node("Camera2D"):
		camera2d = Camera2D.new()
		camera2d.name = "Camera2D"
		add_child(camera2d)
	else:
		camera2d = $Camera2D  # Se já existir, obtenha a referência

	# Lista para armazenar os objetos Sprite2D
	var sprites = []

	# Loop para criar a matriz de objetos Sprite2D
	for row in range(rows):
		for col in range(cols):
			# Cria um novo objeto Sprite2D
			var sprite = Sprite2D.new()
			sprite.texture = load("res://sprites/vaga.png")
			add_child(sprite)
			sprites.append(sprite)

	# Atualiza a posição inicial e ajusta a escala
	update_positions_and_scale(sprites, camera_resolution)

	# Ajusta a Camera2D para abranger a caixa delimitadora
	adjust_camera_to_bounding_box(sprites, camera_resolution)
	
	# Salva a escala inicial da Camera2D
	initial_camera_scale = camera2d.zoom
	initial_camera_position = camera2d.position

	# Gera um objeto no centro em cima do sprite onde a matriz é verdadeira
	generate_objects_on_true_positions(sprites, Global.matrix)
	

func _process(delta):
	$Button.position.x = camera2d.get_screen_center_position().x + 540
	$Button.position.y = camera2d.get_screen_center_position().y - 350
	if Input.is_action_pressed("ui_right"):
		get_tree().change_scene_to_file("res://placa.tscn")

# Função para gerar objetos no centro em cima dos sprites onde a matriz é verdadeira
func generate_objects_on_true_positions(sprites, matrix):
	var sprite_cars = ["res://sprites/carros/carro1.png","res://sprites/carros/carro2.png","res://sprites/carros/carro3.png","res://sprites/carros/carro4.png","res://sprites/carros/carro5.png","res://sprites/carros/carro6.png"]
	for row in range(rows):
		for col in range(cols):
			if matrix[row][col]:
				var sprite = sprites[row * cols + col]

				# Cria um novo objeto para adicionar no centro do sprite
				var new_object = Sprite2D.new()
				new_object.texture = load(sprite_cars[randi() % 6])  # Substitua pela textura desejada
				new_object.scale = sprite.scale  # Mantém a escala do sprite original

				# Calcula a posição para o novo objeto (centro do sprite)
				var x_position = sprite.position.x
				var y_position = sprite.position.y
				new_object.position = Vector2(x_position, y_position)

				add_child(new_object)

# Função para atualizar a posição e ajustar a escala
func update_positions_and_scale(sprites, camera_resolution):
	var scale_factor = 1.0
	var iterations = 0

	# Loop para ajustar a escala
	while not sprites_fit_in_screen(sprites, camera_resolution) and iterations < max_iterations:
		scale_factor *= 0.9

		if scale_factor < min_scale:
			break

		# Não aplique a escala diretamente aos sprites, mantenha a escala original

		iterations += 1

	# Loop para calcular a posição com base na escala atualizada
	for row in range(rows):
		for col in range(cols):
			var sprite = sprites[row * cols + col]

			var center_position = Vector2(camera_resolution.x / 2, camera_resolution.y / 2)

			var x_position = center_position.x + col * (sprite_width * scale_factor + spacing)
			var y_position = center_position.y + row * (sprite_height * scale_factor + spacing)
			sprite.position = Vector2(x_position, y_position)

# Função para verificar se todos os sprites cabem na tela
func sprites_fit_in_screen(sprites, camera_resolution):
	for sprite in sprites:
		var x_position = sprite.position.x + sprite_width * sprite.scale.x
		var y_position = sprite.position.y + sprite_height * sprite.scale.y
		if x_position > camera_resolution.x or y_position > camera_resolution.y:
			return false
	return true

# Função para ajustar a Camera2D para abranger a caixa delimitadora dos sprites
func adjust_camera_to_bounding_box(sprites, camera_resolution):
	# Obtém a caixa delimitadora que contém todos os sprites
	var bounding_box = get_bounding_box(sprites)

	# Ajusta a posição da Camera2D para o centro da caixa delimitadora
	camera2d.position = bounding_box.position + bounding_box.size / 2

	# Calcula o zoom necessário para abranger toda a caixa delimitadora
	var zoom = min(camera_resolution.x / bounding_box.size.x, camera_resolution.y / bounding_box.size.y)

	# Configura o zoom da Camera2D igualmente para ambos os eixos
	camera2d.zoom.x = zoom
	camera2d.zoom.y = zoom

# Função para obter a caixa delimitadora que contém todos os sprites
func get_bounding_box(sprites):
	var min_x = float("inf")
	var min_y = float("inf")
	var max_x = float("-inf")
	var max_y = float("-inf")

	for sprite in sprites:
		var sprite_pos = sprite.position
		var sprite_size = Vector2(sprite_width, sprite_height) * sprite.scale

		min_x = min(min_x, sprite_pos.x - sprite_size.x / 2)
		min_y = min(min_y, sprite_pos.y - sprite_size.y / 2)
		max_x = max(max_x, sprite_pos.x + sprite_size.x / 2)
		max_y = max(max_y, sprite_pos.y + sprite_size.y / 2)

	return Rect2(Vector2(min_x, min_y), Vector2(max_x - min_x, max_y - min_y))

'''
# Callback para manipular o evento de botão do mouse
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Aproxima a câmera onde o mouse estiver quando o botão esquerdo é pressionado
			var mouse_position = get_global_mouse_position()
			var camera_position = camera2d.position
			var new_camera_position = camera_position + (mouse_position - camera_position) * 0.5
			camera2d.position = new_camera_position
			camera2d.zoom = Vector2(0.5, 0.5)
		elif !event.pressed:
			# Desaproxima a câmera quando o botão esquerdo é liberado
			camera2d.position = initial_camera_position
			camera2d.zoom = initial_camera_scale
'''

func _on_button_pressed():
	get_tree().change_scene_to_file("res://placa.tscn")
