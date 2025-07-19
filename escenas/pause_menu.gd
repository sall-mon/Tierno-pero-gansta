extends Node2D

signal boton_salir()
signal boton_jugar()

func _on_botonsalir_pressed() -> void:
	boton_salir.emit()
	pass # Replace with function body.

func _on_botonjugar_pressed() -> void:
	boton_jugar.emit()
	pass # Replace with function body.
