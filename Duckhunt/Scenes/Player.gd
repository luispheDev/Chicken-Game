extends Area2D


#Variaveis

#"export" acessa o valor do var direto do spector == variaveis public no unity
export var speed = 100
var screen_size
#forma de comunicação interna, emite sinais de um obj para outro obj
signal pontua


func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2()
	
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
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
		$AnimatedSprite.animation = "Chicken_Down"
	elif velocity.y < 0:
		$AnimatedSprite.animation = "Chicken_Up"

func _on_Player_body_entered(body):
	if body.name == "ganha":
		emit_signal("pontua")
	else:
		$AudioStreamPlayer2D.play()
	position.x = 400
	position.y = 696
