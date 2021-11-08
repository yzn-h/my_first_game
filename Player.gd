extends KinematicBody2D

var can_move = false
export var speed = 100
var die = false

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	animation()
	

func _physics_process(delta):
	if can_move and !die:
		get_input()
	else:
		velocity = Vector2.ZERO
	animation()
	velocity = move_and_slide(velocity)

func animation():
	if die:
		$AnimationPlayer.play("die")
	elif velocity == Vector2.ZERO:
		$AnimationPlayer.play("RESET")
	else:
		$AnimationPlayer.play("move")

func _change_if_can_move(can:bool):
	can_move = can

func _die():
	die = true
	yield(get_tree().create_timer(0.7), "timeout")
	get_tree().reload_current_scene()

func _on_hitbox_area_entered(area):
	if area.is_in_group("kill"):
		print("nice")
		_die()

