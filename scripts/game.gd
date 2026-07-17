extends Node2D

# Variavel que armazena a cena do carro
var carro_scene: PackedScene = preload("res://scenes/carro.tscn")
var score: int

# Função que chama a mudança de cena para a cena de Vitoria e atualiza o score
func player_entrou_na_area(_body: Node2D) -> void:
	# Adia a troca de cena para evitar conflitos com o processamento de física da área.
	call_deferred("change_scene_vitoria")
	if score > Global.score:
		Global.score = score
	
# Função que objetivamente troca a cena do game pela cena de vitoria
func change_scene_vitoria():
	get_tree().change_scene_to_file("res://scenes/vitoria.tscn")
# Função que objetivamente troca a cena do Game pela cena de Game-Over
func change_scene_game_over():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
# Função que objetivamente troca a cena do Game pela cena do Menu
func change_scene_menu():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
# Função que instancia o carro quando o timer zera
func _on_carro_timer_timeout() -> void:
	var carro = carro_scene.instantiate() as Area2D
	var pos_marker = $CarroPosicaoInicial.get_children().pick_random() as Marker2D
	carro.position = pos_marker.position
	$Objetos.add_child(carro)
	carro.connect("body_entered", go_to_title)

# Função que chama a mudança de cena para a cena de Game-Over
func go_to_title(_body):
	call_deferred("change_scene_game_over") 
	
# Função que atualiza o label do score
func _on_score_timer_timeout() -> void:
	score += 1
	$CanvasGroup/Label.text = str(score)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("sair"):
		call_deferred("change_scene_menu")
