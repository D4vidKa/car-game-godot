extends Control

@onready var button_som = $AudioStreamPlayer
func _ready() -> void:
	# Percorre todos os nós do jogo que pertencem ao grupo "button"
	for button in get_tree().get_nodes_in_group("button"):
		# Conecta o clique do botão à função de clique, passando o próprio botão como argumento
		button.connect("pressed", Callable(self, "on_button_pressed").bind(button))
		# Conecta a saída do mouse à função de interação, informando o botão e o estado "exited"
		button.connect("mouse_exited", Callable(self, "mouse_interaction").bind(button, "exited"))
		# Conecta a entrada do mouse à função de interação, informando o botão e o estado "entered"
		button.connect("mouse_entered", Callable(self, "mouse_interaction").bind(button, "entered"))
		# Conecta a entrada do teclado à função de interação, informando o botão e o estado "entered"
		button.connect("focus_entered", Callable(self, "mouse_interaction").bind(button, "entered"))
		# Conecta a entrada do teclado à função de interação, informando o botão e o estado "exited"
		button.connect("focus_exited", Callable(self, "mouse_interaction").bind(button, "exited"))
		
		button.connect("focus_entered", Callable(self, "on_button_focus").bind(button))
		
	$VBoxContainer/Jogar.grab_focus(true)
# Função que defini oque cada botão fizer quando apertado
func on_button_pressed(button: Button) -> void:
	match button.name:
		"Jogar":
			get_tree().change_scene_to_file("res://scenes/game.tscn")
		"Sair":
			get_tree().quit()
			
# Função que muda a transparecia quando o mouse está em cima do botão
func mouse_interaction(button: Button, state: String):
	match state:
		"exited":
			button.modulate.a = 1
		"entered":
			button.modulate.a = 0.5

func on_button_focus(_button:Button):
	button_som.play()
