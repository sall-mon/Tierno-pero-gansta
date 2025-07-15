extends CharacterBody2D

var spawnRotation = Vector2(1.0,0.0)
var spawnPosition : Vector2
var dir : float

@export var speed = 600.0

func _ready():
	global_position = spawnPosition
	global_rotation = spawnRotation

func _physics_process(delta: float):
	velocity = Vector2(0, -speed).rotated(dir)
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.eplosion()
	await get_tree().create_timer(2).timeout
	get_tree().quit()
