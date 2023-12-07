# Script de funções do cano.

extends Node2D

export var velocidade = -400

var cena

func _ready():
	cena = get_tree().get_current_scene()
	set_process(true)
	
func _process(delta):
	if cena.estado == cena.JOGANDO:
		set_pos(get_pos() + Vector2(vel * delta, 0))
	
	if get_pos().x < -100:
		queue_free()


# Cano é acertado pelo pássaro.
func _on_Area2D_body_enter( body ):
	if body.get_name() == "Passaro":
		cena.kill()

# Cano não é acertado.
func _on_Ponto_body_enter( body ):
	cena.pontuar()
