extends Node2D


func _on_botonjugar_pressed() -> void:
	Global.puntaje = 0
	get_tree().change_scene_to_file("res://escenas/game.tscn")


func _on_botonsalir_pressed() -> void:
	get_tree().quit()


func _on_boton_ver_puntitos_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/highscore_screen.tscn")
