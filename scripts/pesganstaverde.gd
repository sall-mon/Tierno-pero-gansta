extends StaticBody2D

@onready var bala = load("escenas/bala.tscn")
var inRange = false
var target

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
	startShooting()
	target = body


func _on_range_body_exited(body: Node2D) -> void:
	stopShooting()
	pass # Replace with function body.


func startShooting():
	$Timer.start()
	pass


func stopShooting():
	$Timer.stop()
	pass


func _on_timer_timeout() -> void:
	var angle = (target.global_position - (global_position + Vector2(130, -30))).angle() + ((90.0/180.0)*PI)
	if target.isAlive():
		fire(angle)
