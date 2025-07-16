extends Node2D

func _on_botonjugar_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/game.tscn")


func _on_botonsalir_pressed() -> void:
	get_tree().quit()
