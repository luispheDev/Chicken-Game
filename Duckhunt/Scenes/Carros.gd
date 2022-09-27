extends RigidBody2D


func _ready():
	#codigo para mudar cor do carro. criou um array com os nomes das animações
	var corDoCarro = $AnimatedSprite.frames.get_animation_names()
	#tamanho do array é 0 até a qtnd de frames dentro de $AnimatedSprit.frames
	$AnimatedSprite.animation = corDoCarro[randi() % corDoCarro.size()]
	

func _on_VisibilityNotifier2D_screen_exited():
	#basicamente limpando a memoria do carro que saiu da tela, tipo um destroy()
	queue_free()
