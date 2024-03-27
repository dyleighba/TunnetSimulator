extends Node

@export var world: Node2D
@export var placeholder: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("create_placeholder"):
		var pos = world.get_local_mouse_position()
		placeholder.position = Vector2(pos.x - 32, pos.y - 32)
