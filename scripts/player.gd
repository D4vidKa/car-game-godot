extends CharacterBody2D

# Atributos do script
var direcao: Vector2
var velocidade: float = 140

# Roda em um intervalo de tempo fixo (geralmente 60 FPS). 
# Use para movimentação, gravidade e detecção de colisões.
func _physics_process(_delta: float) -> void:
	# Usado para fazer o personagem andar em cada direção
	direcao = Input.get_vector("esquerda","direita","cima","baixo")
	
	velocity = direcao * velocidade
	
	animacao()
	
	# Move o corpo usando a variável 'velocity'
	# , desliza em colisões e já aplica o 'delta' automaticamente
	move_and_slide()

# Metodo para fazer os sprites do personagem funcionarem de forma correta
func animacao():
	if direcao:
		$AnimatedSprite2D.flip_h = direcao.x > 0
		if direcao.x != 0:
			$AnimatedSprite2D.animation = "esquerda"
		else:
			$AnimatedSprite2D.animation = "cima" if direcao.y < 0 else "baixo"
	else:
		$AnimatedSprite2D.frame = 0
