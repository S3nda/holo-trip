extends TileMap

var width = 80
var height = 80
var count = 0

var atlas_size = 4

@onready var player = get_parent().get_child(0)
@export var atlas_x= 0
@export var atlas_y= 0

func _ready():
	pass

func _physics_process(delta):
	count += 1
	if (count%30 == 0):
		print(count,player.position)
		generate_chunk(player.position)
	

func generate_chunk(position):
	var tile_pos = local_to_map(position) #position du player sur la grille
	print(tile_pos)
	for x in range(0,width):
		for y in range(0,height):
			set_cell(0, Vector2i(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y), 0, Vector2i(rand_coos(),rand_coos()))



func rand_coos():
	return randi_range(0,4)

"""
	for x in range(width):
		atlas_x = rand_coos(atlas_x)
		atlas_y = rand_coos(atlas_y)
		for y in range(height):
			set_cell(0, Vector2i(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y), 0, Vector2i(1,3))
"""
