extends Node2D

var random = RandomNumberGenerator.new()
onready var x

# Called when the node enters the scene tree for the first time.
func _ready():
	random.randomize()
	x = random.randi_range(2,108)
	self.global_position.x = x

func _physics_process(delta):
	self.global_position.y += 100 * delta

	


func _on_Timer_timeout():
	self.queue_free()
