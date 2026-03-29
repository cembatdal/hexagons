extends Button

func _on_pressed() -> void:
	# 1. TurnManager'a "Turu geç ve tüm hesaplamaları yap" emrini veriyoruz
	TurnManager.end_turn()
	
	# 2. Konsolda ne olup bittiğini rahatça görmek için bir özet yazdırıyoruz
	print("--- BUTONA BASILDI ---")
	print("Mevcut Gün: ", GameState.current_day)
	print("Kalan Su: ", ResourceManager.water.current)
	print("Oyun Bitti mi?: ", GameState.is_game_over)
	print("----------------------\n")
