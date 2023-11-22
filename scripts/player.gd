extends CharacterBody2D

@export var speed = 500
@export var rotation_speed = 2
var boost = 0
var rotation_direction = 0
var count = 0

func _ready():
	pass

func _physics_process(delta):
	get_input()
	count += 1
	print(count, "x", boost)

	if (count % 30 == 0) and boost < 9:
		boost += 1
	print(count,boost)
	if speed > 800:
		
		speed *= 0.88
	
	if Input.is_action_pressed("spacebar") and boost / 3 in [1,2,3]:
		Input.action_release("spacebar")
		boost -=3
		speed = 5000




	rotation += rotation_direction * rotation_speed * delta
	velocity = -transform.y * speed
	
	move_and_slide()

func get_input():
	rotation_direction = Input.get_axis("left", "right")

func _process(delta):
	print(count,boost)
