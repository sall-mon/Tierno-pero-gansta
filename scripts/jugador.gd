extends CharacterBody2D

@export var speed = 500
var alive = true


func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	if Input.is_key_pressed(KEY_SHIFT) and not Input.is_key_pressed(KEY_SPACE):
		velocity *= 1.5
	if Input.is_key_pressed(KEY_SPACE):
		velocity /= 2


func eplosion():
	$AnimationPlayer.play("eplosion")
	$Camara/reproductorMusica.stop()
	alive = false
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://escenas/death_screen.tscn")

func isAlive():
	return self.alive

func _physics_process(delta):
	if alive:
		get_input()
		move_and_slide()
