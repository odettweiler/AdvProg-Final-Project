extends Camera2D

var light_player:Node2D
var dark_player:Node2D

const SPEED = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	light_player = get_node("../LightPlayer")
	dark_player = get_node("../DarkPlayer")
	var player:Node2D
	if Globals.is_light_dimension:
		player = light_player
	else:
		player = dark_player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player:Node2D
	if Globals.is_light_dimension:
		player = light_player
	else:
		player = dark_player
		
	var move_dir = Vector2.ZERO
	var dir = player.position - self.position
	
	if abs(player.position.x - self.position.x) > 500:
		move_dir = dir.normalized() * SPEED
	if abs(player.position.y - self.position.y) > 150:
		move_dir = dir.normalized() * SPEED
	
	self.position = self.position + move_dir
	
func insta_move(x, y):
	self.position_smoothing_enabled = false
	self.position.x = x
	self.position.y = y
	self.position_smoothing_enabled = true
