extends Node

var water = GameResouce.new()
var scrap = GameResouce.new()
var morale = GameResouce.new()
var workforce = GameResouce.new()

signal resource_changed(resource_name, new_value, max_value)

#var current_water_level: int = 10

class GameResouce:
	var _current: int = 0
	var max_value: int = 100
	
	var current: int:
		get:
			return _current
		set(value):
			push_error("HATA: current değerine doğrudan yazılamaz! ResourceManager metodlarını kullanın.")
	
	func update_current(new_value:int):
		_current = new_value
