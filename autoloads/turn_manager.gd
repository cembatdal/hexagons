extends Node

signal turn_ended()

func end_turn():
	if GameState.is_game_over:
		return

	_calculate_workforce()

	_produce_resources()

	_consume_resources()

	if GameState.is_game_over:
		return

	_advance_day()

	_reset_workforce()

	turn_ended.emit()
	
func _calculate_workforce():
	print("1. İşçiler hesaplandı")
	
func _produce_resources():
	print("2. Kaynaklar üretildi")

func _consume_resources():
	ResourceManager.remove_water(1)
	print("3. Kaynaklar tüketildi")
	
func _advance_day():
	GameState.current_day += 1
	print("4. Gün arttı. Yeni gün: ", GameState.current_day)

func _reset_workforce():
	ResourceManager.reset_workforce()
	print("5. İşçiler yenilendi")
