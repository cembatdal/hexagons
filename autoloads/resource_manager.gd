extends Node

signal resource_amount_changed(resource_name: String, new_value: int, max_value: int, min_value: int)

var water = GameResource.new()
var scrap = GameResource.new()
var morale = GameResource.new()
var workforce = GameResource.new()
var population = GameResource.new()

func _ready():
	water.max_value = 100
	water.min_value = 0
	water.update_current(5)
	
	scrap.max_value = 100
	scrap.min_value = 0
	scrap.update_current(2)
	
	morale.max_value = 100
	morale.min_value = 0
	morale.update_current(50)
	
	workforce.max_value = population.current 
	workforce.min_value = 0
	workforce.update_current(population.current)
	
	population.max_value = 10
	population.min_value = 0
	population.update_current(2)
	
func add_water(amount: int):
	var new_amount = clamp(water.current + amount, water.min_value, water.max_value)
	water.update_current(new_amount)
	resource_amount_changed.emit("water", water.current, water.max_value, water.min_value)

func remove_water(amount: int):
	var new_amount = clamp(water.current - amount, water.min_value, water.max_value)
	water.update_current(new_amount)
	resource_amount_changed.emit("water", water.current, water.max_value, water.min_value)
	
func add_scrap(amount: int):
	var new_amount = clamp(scrap.current + amount, scrap.min_value, scrap.max_value)
	scrap.update_current(new_amount)
	resource_amount_changed.emit("scrap", scrap.current, scrap.max_value, scrap.min_value)

func remove_scrap(amount: int):
	var new_amount = clamp(scrap.current - amount, scrap.min_value, scrap.max_value)
	scrap.update_current(new_amount)
	resource_amount_changed.emit("scrap", scrap.current, scrap.max_value, scrap.min_value)
	
func add_morale(amount: int):
	var new_amount = clamp(morale.current + amount, morale.min_value, morale.max_value)
	morale.update_current(new_amount)
	resource_amount_changed.emit("morale", morale.current, morale.max_value, morale.min_value)

func remove_morale(amount: int):
	var new_amount = clamp(morale.current - amount, morale.min_value, morale.max_value)
	morale.update_current(new_amount)
	resource_amount_changed.emit("morale", morale.current, morale.max_value, morale.min_value)
	
func add_workforce(amount: int):
	var new_amount = clamp(workforce.current + amount, workforce.min_value, workforce.max_value)
	workforce.update_current(new_amount)
	resource_amount_changed.emit("workforce", workforce.current, workforce.max_value, workforce.min_value)

func remove_workforce(amount: int):
	var new_amount = clamp(workforce.current - amount, workforce.min_value, workforce.max_value)
	workforce.update_current(new_amount)
	resource_amount_changed.emit("workforce", workforce.current, workforce.max_value, workforce.min_value)
	
func reset_workforce():
	workforce.max_value = population.current
	workforce.update_current(population.current)
	resource_amount_changed.emit("workforce", workforce.current, workforce.max_value, workforce.min_value)

class GameResource:
	var _current: int = 0
	var max_value: int = 100
	var min_value: int = 0
	
	var current: int:
		get:
			return _current
		set(value):
			push_error("HATA: current değerine doğrudan yazılamaz! ResourceManager metodlarını kullanın.")
	
	func update_current(new_value:int):
		_current = new_value
