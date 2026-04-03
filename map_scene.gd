extends Node2D

@onready var tile_map_layer = $TileMapLayer

var tile_type_map: Dictionary = {}

func _generate_map():
	for x in range(GameConfig.MAP_COLUMNS):
		for y in range(GameConfig.MAP_ROWS):
			var coords = Vector2i(x,y)
			tile_map_layer.set_cell(coords,0,Vector2i(2,2))
			tile_type_map[coords] = GameConfig.TILE_EMPTY
			
	var center_tile: Vector2i = Vector2i(GameConfig.MAP_COLUMNS/2, GameConfig.MAP_ROWS/2)
	var valid_scrap_coords: Array = []
	
	for i in tile_type_map.keys():
		var distance_to_center = max(abs(i.x - center_tile.x), abs(i.y - center_tile.y))
		if distance_to_center >= GameConfig.SCRAP_MIN_DISTANCE:
			valid_scrap_coords.append(i)
	
	valid_scrap_coords.shuffle()
	
	for i in range(GameConfig.SCRAP_COUNT):
		var scrap_coord = valid_scrap_coords[i]
		tile_type_map[scrap_coord] = GameConfig.TILE_SCRAP
		tile_map_layer.set_cell(scrap_coord,0,Vector2i(6,13))

func _ready() -> void:
	_generate_map()
	print(tile_type_map)
