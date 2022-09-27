extends Node

const novoCarro = preload("res://Scenes/Carros.tscn")

var pdevagar = [575, 440, 262, 147, 316]
var prapido = [515, 380, 206, 84]

var score1 = 0
var score2 = 0

func _ready():
	pass


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
