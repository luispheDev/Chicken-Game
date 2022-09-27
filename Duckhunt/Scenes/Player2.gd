extends Area2D


#Variaveis

#"export" acessa o valor do var direto do spector == variaveis public no unity
export var speed = 100
var screen_size
#forma de comunicação interna, emite sinais de um obj para outro obj
signal pontua2


func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2()
	
	if Input.is_action_pressed("desce"):
		velocity.y += 1
	if Input.is_action_pressed("sobe"):
		velocity.y -= 1
	
	#iniciando e parando as animações
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta
	
	#evita que o personagem saia da cena
	position.y = clamp(position.y, 0, screen_size.y)
	
	#Tocar animações certas
	if velocity.y > 0:
		$AnimatedSprite.animation = "Chicken2_Down"
	elif velocity.y < 0:
		$AnimatedSprite.animation = "Chicken2_Up"

func _on_Player2_body_entered(body):
	if body.name == "ganha":
		emit_signal("pontua2")
	else:
		$AudioStreamPlayer2D.play()
	position.x = 944
	position.y = 696
