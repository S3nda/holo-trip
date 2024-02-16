extends Area2D

@export var speed: int = 15
var direction := Vector2.ZERO
@onready var kill_timer = $KillTimer
func _ready():
	kill_timer.start()

func _physics_process(_delta):

	if direction != Vector2.ZERO:
		var velocity = direction * speed
		global_position += velocity
		


func set_direction(bdirection: Vector2):
	self.direction = bdirection
	rotation += bdirection.angle()


func _on_kill_timer_timeout():
	queue_free()
