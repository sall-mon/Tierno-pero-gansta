extends CharacterBody2D

@export var speed = 500
var alive = true

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	if Input.is_key_pressed(KEY_SHIFT):
		velocity *= 1.5
	if Input.is_key_pressed(KEY_SPACE):
		velocity /= 2

func eplosion():
	$AnimationPlayer.play("eplosion")
	$Camera2D/AudioStreamPlayer2D.stop()
	alive = false

func _physics_process(delta):
	if alive:
		get_input()
		move_and_slide()
	
	
