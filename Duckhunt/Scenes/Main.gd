extends Node

const novoCarro = preload("res://Scenes/Carros.tscn")

var pdevagar = [575, 440, 262, 147, 316]
var prapido = [515, 380, 206, 84]

var score1 = 0
var score2 = 0

func _ready():
	$Button.hide()
	$tema.play()
	randomize()
	


func _on_horaCarroRapido_timeout():
	#recebe instancia da cena Carros
	var carroRapido = novoCarro.instance()
	add_child(carroRapido)
	#instancia o carro  na posição -10 de x, onde não aparece na tela pra não saber de onde vai sair 
	carroRapido.position.x = -10
	#posições aleatorias
	carroRapido.position.y = prapido[randi() % prapido.size()]
	#velocidade dos carros rapidos
	carroRapido.linear_velocity = Vector2(rand_range(600, 625), 0)


func _on_horaCarroDevagar_timeout():
	#recebe instancia da cena Carros
	var carroDevagar = novoCarro.instance()
	add_child(carroDevagar)
	#instancia o carro  na posição -10 de x, onde não aparece na tela pra não saber de onde vai sair 
	carroDevagar.position.x = -10
	#posições aleatorias
	carroDevagar.position.y = pdevagar[randi() % prapido.size()]
	#velocidade dos carros devagar
	carroDevagar.linear_velocity = Vector2(rand_range(300, 325), 0)


func _on_Player_pontua():
	if score1 < 10:
		score1 += 1
		$ponto.play()
		$placar1.text = str(score1)
	if score1 >= 10:
		$Button.show()
		$tema.stop()
		$resultado.text = "p1 Ganhou"
		$ganhou.play()
		$horaCarroDevagar.stop()
		$horaCarroRapido.stop()


func _on_Player2_pontua2():
	if score2 < 10:
		score2 += 1
		$ponto.play()
		$placar2.text = str(score2)
	if score2 >= 10:
		$Button.show()
		$tema.stop()
		$resultado.text = "p2 Ganhou"
		$ganhou.play()
		$horaCarroDevagar.stop()
		$horaCarroRapido.stop()


func _on_Button_pressed():
	$Button.hide()
	score1 = 0
	score2 = 0
	$placar1.text = "0"
	$placar2.text = "0"
	$resultado.text = ""
	$horaCarroDevagar.start()
	$horaCarroRapido.start()
	$Player.volta()
	$Player2.volta()
	$tema.play()
