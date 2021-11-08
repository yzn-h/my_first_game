extends Node2D

export var bullet_scene:PackedScene

onready var attack_timer = $attack_time

func start_up_attack():
	var bullet = bullet_scene.instance()
	add_child(bullet)


func _on_attack_time_timeout():
	get_parent().get_node("AnimationPlayer").play("big_attack")
