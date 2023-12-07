# Script de funções de jogabilidade.

extends Node2D

onready var passaro = get_node("Passaro")
onready var timereplay = get_node("TimeToReplay")
onready var label = get_node("Node2D/Control/Label")

var pontos = 0
var estado = 1

const JOGANDO = 1
const PERDENDO = 2

func _ready():
	pass
	
# Função caso o pássaro acerte um cano e perca.
func kill():
	passaro.apply_impulse(Vector2(0,0), Vector2(-1000, 0))
	get_node("BackAnim").stop()
	estado = PERDENDO
	timereplay.start()
	get_node("SomHit").play()
	
# Função caso o pássaro passe entre os canos e pontue.
func pontuar():
	pontos += 1
	label.set_text(str(pontos))
	get_node("SomScore").play()

func _on_TimeToReplay_timeout():
	get_tree().reload_current_scene()
