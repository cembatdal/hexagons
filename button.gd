extends Button

func _on_pressed() -> void:
	GameState.current_day = GameState.current_day + 1
	get_tree().change_scene_to_file("res://test_2.tscn")
