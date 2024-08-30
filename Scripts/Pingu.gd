extends KinematicBody2D

var velocidad = 120
var brinco = -150
var gravedad = 300
var movimiento = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	movimiento.x = 0
	movimiento.y += gravedad * delta
	
	if Input.is_action_pressed("ui_right"):
		movimiento.x += 1 * velocidad
		$Sprite.flip_h = false
		$AnimationPlayer.play("Caminando")
		
	elif Input.is_action_pressed("ui_left"):
		movimiento.x += -1 * velocidad
		$Sprite.flip_h=true
		$AnimationPlayer.play("Caminando")
		
	else:
		$AnimationPlayer.play("Quieto")
		
	if is_on_floor() && Input.is_action_just_pressed("ui_accept"):
		movimiento.y = brinco
	
	movimiento = move_and_slide(movimiento, Vector2(0, -1))
		
