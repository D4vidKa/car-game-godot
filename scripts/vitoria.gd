extends Control

func _ready() -> void:
	# Atualiza o texto com a pontuação
	$Label2.text = "Pontuação: " + str(Global.score)

# Função que serve para voltar para a cena do Jogo quando o usuario apertar Espaço
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("confimar"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
