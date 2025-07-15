extends StaticBody2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.eplosion()
	await get_tree().create_timer(2).timeout
	get_tree().quit()
