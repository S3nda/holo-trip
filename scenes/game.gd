extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var bullet_manager = $BulletManager
	var player = $Player
	player.player_fired_bullet.connect(bullet_manager.handle_bullet_spawned)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
