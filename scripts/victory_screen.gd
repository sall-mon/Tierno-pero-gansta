extends Node2D

func _ready() -> void:
	$RichTextLabel/Puntos.text = str(Global.puntaje)

func _exit_tree() -> void:
	var file = FileAccess.open("data.txt", FileAccess.READ_WRITE)
	if not file:
		file = FileAccess.open("data.txt", FileAccess.WRITE)
	var nombre = $RichTextLabel/IngresarNombre.text
	var puntos = str(Global.puntaje)
	var saveString = nombre + "\t" + puntos + "\n"
	if file:
		file.seek_end()
		file.store_string(saveString)
		file.close()
	else:
		print("error abriendo el archivo, creando uno nuevo")

func _on_botonjugar_pressed() -> void:
	Global.puntaje = 0
	get_tree().change_scene_to_file("res://escenas/game.tscn")

func _on_botonsalir_pressed() -> void:
	get_tree().quit()

func _on_boton_ver_puntitos_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/highscore_screen.tscn")
