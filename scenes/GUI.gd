extends CanvasLayer



# Called when the node enters the scene tree for the first time.
func _ready():
	%GUIBar.modulate.a = 0.5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if %Player.boost < 3:
		%BoostLevels.set_frame(0)
	
	if %Player.boost in [3,5]:
		%BoostLevels.set_frame(1)
	
	if %Player.boost in [6 ,8] :
		%BoostLevels.set_frame(2)
	
	if %Player.boost == 9:
		%BoostLevels.set_frame(3)

	
