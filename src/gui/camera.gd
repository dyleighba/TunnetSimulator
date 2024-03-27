extends Node2D

const MOVE_SPEED: float = 10;
var previous_pos = Vector2(0,0);
var previous_mouse_pos = Vector2(0,0);
var zoom_level = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("move_camera"):
		previous_pos = self.position
		previous_mouse_pos = self.get_global_mouse_position()
	if Input.is_action_pressed("move_camera"):
		var mouse_delta = previous_mouse_pos - self.get_global_mouse_position()
		self.position = previous_pos - mouse_delta
	if Input.is_action_just_pressed("zoom_in"):
		change_zoom_level(-1)
	if Input.is_action_just_pressed("zoom_out"):
		change_zoom_level(1)

func change_zoom_level(delta: int):
	zoom_level = max(min(zoom_level + delta, 20), 0)
	var scale_mouse_pos =  self.get_local_mouse_position()
	self.scale = Vector2(1.0-(zoom_level*0.04), 1.0-(zoom_level*0.04))
	var mouse_delta = (scale_mouse_pos - self.get_local_mouse_position())
	self.position = self.position - (mouse_delta*self.scale.x)
	print("Zoom Level: ", zoom_level)
	print("Scale: ", 1.0-(zoom_level*0.04))
