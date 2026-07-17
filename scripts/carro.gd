extends Area2D

# Variaveis do carro
var direcao: Vector2 = Vector2.LEFT
var velocidade: int = 180

# Variavel que armazena 3 sprites diferentes
var cores = [
	preload("res://graphics/cars/green.png"),
	preload("res://graphics/cars/red.png"),
	preload("res://graphics/cars/yellow.png")]

func _ready() -> void:
	# Se o carro carro for spawnado na esquerda, muda a direção para a direita
	if position.x < 0:
		direcao.x = 1
		$Sprite2D.flip_h = true
	# Cria o carro com 1 sprite aleatorio do Array criado na Variavel "Cores"
	$Sprite2D.texture = cores.pick_random()

# Função que determina a posição do carro na cena
func _process(delta: float) -> void:
	position += direcao * velocidade * delta

# Função para deletar o carro quando ele sai da tela
func carro_saiu_da_tela() -> void:
	queue_free()
