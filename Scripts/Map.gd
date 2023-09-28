extends TileMap

@export var world_tile_map : TileMap = null

# Called when the node enters the scene tree for the first time.
func _ready():
	for cell_position in world_tile_map.get_used_cells(1):
		self.set_cell(0, cell_position, 0, Vector2i())
