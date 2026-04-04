extends Node

const TILE_OCCUPIED: int = 2
const TILE_SCRAP: int = 1
const TILE_EMPTY: int = 0

const MAP_ROWS: int = 18
const MAP_COLUMNS: int = 8

const SCRAP_COUNT: int = 3
const SCRAP_MIN_DISTANCE: int = 2

enum BuildingType {NONE, WATER_COLLECTOR, SHELTER}
