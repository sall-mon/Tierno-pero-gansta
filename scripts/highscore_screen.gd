extends Node2D

func _ready():
	var file = FileAccess.open("data.txt", FileAccess.READ)
	var data = []
	if file:
		while not file.eof_reached():
			var texto = file.get_line()
			var dataFromFile = texto.split("\t")
			if not dataFromFile[0] == "":
				data.append_array(dataFromFile)
	else:
		print("error")
	print(data)
	dataSorter(data)
	print("after sort\n" + str(data))
	for i in range(0, data.size(), 2):
		$TablaPuntajeNombres.text += data[i] + "\n"
		$TablaPuntajePuntos.text += data[i+1] + "\n"

func dataSorter(data: Array):
	for i in range(0, data.size()-2, 2):
		for j in range(0, data.size()-2-i, 2):
			if int(data[j+1]) < int(data[j+3]):
				var aux = data[j]
				var aux2 = data[j+1]
				data[j] = data[j+2]
				data[j+1] = data[j+3]
				data[j+2] = aux
				data[j+3] = aux2
	pass

func _on_botonjugar_pressed() -> void:
	Global.puntaje = 0
	get_tree().change_scene_to_file("res://escenas/game.tscn")

func _on_botonsalir_pressed() -> void:
	get_tree().quit()
