extends Node2D

func _process(delta: float) -> void:
	$Jugador/Camara/mostradorDePuntaje/puntos.text = str(Global.puntaje)
	$Jugador/Camara/TiempoRestante.text = "%d:%02d" % [floor($Jugador/Camara/TiempoDeJuego.time_left / 60), int($Jugador/Camara/TiempoDeJuego.time_left) % 60]
	if Input.is_key_pressed(KEY_SPACE) and $Jugador/Camara.zoom == Vector2(1, 1):
		$Jugador/Camara/AnimadorCamara.play("zoom out")
	elif $Jugador/Camara.zoom != Vector2(0.4, 0.4) and not Input.is_key_pressed(KEY_SPACE):
		$Jugador/Camara/AnimadorCamara.play("zoom in")
	
	if Input.is_key_pressed(KEY_ESCAPE):
		pause()

func pause():
	$Jugador/Camara/pause_menu.visible = true
	get_tree().paused = true

func _on_tiempo_de_juego_timeout() -> void:
	$Jugador/Camara/TiempoDeJuego.stop()
	get_tree().change_scene_to_file("res://escenas/victory_screen.tscn")


func _on_pause_menu_boton_jugar() -> void:
	$Jugador/Camara/pause_menu.visible = false
	get_tree().paused = false


func _on_pause_menu_boton_salir() -> void:
	get_tree().quit()
