extends SubViewport

@export var player : CharacterBody2D = null
@export var chest_icon : Sprite2D = null
@export var chest : Sprite2D = null
@export var player_icon : Sprite2D = null

@onready var timer : Timer = $Timer
@onready var camera : Camera2D = $MapCamera

func _ready():
	timer.timeout.connect(on_timeout)

func _process(delta):
	# update the viewport camera to match where the player is
	camera.position = player.position
	# put the chest icon where the actual chest is, except clamp it to the bounds of the camera
	chest_icon.position = chest.position.clamp(camera.position - Vector2(self.size)/2, camera.position + Vector2(self.size)/2)

func on_timeout():
	var plr_icon_copy = player_icon.duplicate()
	plr_icon_copy.scale = Vector2(0.5, 0.5)
	plr_icon_copy.modulate = Color(Color.WHITE, 0.5)
	plr_icon_copy.z_index = player_icon.z_index-1
	plr_icon_copy.position = camera.position
	add_child(plr_icon_copy)
	var destroy_delay_timer = Timer.new()
	destroy_delay_timer.one_shot = true
	destroy_delay_timer.timeout.connect(func(): self.remove_child(destroy_delay_timer); self.remove_child(plr_icon_copy))
	self.add_child(destroy_delay_timer) 
	destroy_delay_timer.start(1.5)
