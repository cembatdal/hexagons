extends Node

signal game_over_triggered(reason: GameOverReason)

var current_day: int = 1
var is_game_over: bool = false
enum GameOverReason {NONE, NO_WATER, NO_MORALE, SURVIVED}
var game_over_reason = GameOverReason.NONE

func _ready():
	ResourceManager.resource_amount_changed.connect(_on_resource_changed)

func _on_resource_changed(resource_name: String, new_value: int, max_value: int, min_value: int):
	if is_game_over == true:
		return
	
	if resource_name == "water" and new_value <= 0:
		trigger_game_over(GameOverReason.NO_WATER)
	if resource_name == "morale" and new_value <= 0:
		trigger_game_over(GameOverReason.NO_MORALE)
		
func trigger_game_over(reason):
	is_game_over = true
	game_over_reason = reason
	game_over_triggered.emit(reason)
