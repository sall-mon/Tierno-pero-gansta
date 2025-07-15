extends StaticBody2D

@onready var bala = load("escenas/bala.tscn")
var inRange = true

func _ready():
	pass

func _physics_process(delta: float) -> void:
	pass

func fire(angle: float):
	var instance = bala.instantiate()
	instance.dir = angle
	instance.spawnPosition = global_position + Vector2(130, -30)
	instance.spawnRotation = global_rotation
	add_child(instance)


func _on_range_body_entered(body: Node2D) -> void:
	inRange = true
	while inRange:
		await get_tree().create_timer(0.6).timeout
		var angle = (body.global_position - global_position).angle() + ((90.0/180.0)*PI)
		fire(angle)


func _on_range_body_exited(body: Node2D) -> void:
	inRange = false
	pass # Replace with function body.
