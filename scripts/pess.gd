extends StaticBody2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	Global.puntaje += 1
	queue_free()
