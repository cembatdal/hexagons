extends Node

var is_card_active: bool = false

var map_scene_template = preload("res://map_scene.tscn")
var card_scene_template = preload("res://card_scene.tscn")
var hud_scene_template = preload("res://hud_scene.tscn")

func _ready() -> void:
	var map_instance = map_scene_template.instantiate()
	var card_instance = card_scene_template.instantiate()
	var hud_instance = hud_scene_template.instantiate()

	add_child(map_instance)
#	add_child(card_instance)
	add_child(hud_instance)
	
	card_instance.hide()
