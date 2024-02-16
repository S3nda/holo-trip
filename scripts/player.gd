extends CharacterBody2D

@export var speed = 500
@export var rotation_speed = 5
@onready var gun = $Gun
@onready var gundir = $GunDir
var boost = 0
var rotation_direction = 0
var count = 0
var Bullet: PackedScene = preload("res://objects/Bullet.tscn")

signal player_fired_bullet(bullet,position,direction)

func _physics_process(delta):	
	set_boost()
	rotation_direction = Input.get_axis("left", "right")
	self.rotation += rotation_direction * rotation_speed * delta
	self.velocity = -transform.y * speed
	move_and_slide()

func shoot():
	var bullet = Bullet.instantiate()
	var direction = (gundir.global_position - gun.global_position).normalized()
	emit_signal("player_fired_bullet", bullet, gun.global_position, direction)
	

func set_boost():
	self.count += 1
	if (self.count % 30 == 0) and self.boost < 9:
		self.boost += 1
	if speed > 800:
		self.speed *= 0.88
	
	if Input.is_action_pressed("spacebar") and self.boost > 2:
		Input.action_release("spacebar")
		if self.boost == 3:
			self.speed = 5000
		elif self.boost == 6:
			self.speed = 12000
		elif self.boost == 9:
			self.speed = 20000
		self.boost = 0

func _unhandled_input(event):
	if event.is_action_released("shoot"):
		shoot()
