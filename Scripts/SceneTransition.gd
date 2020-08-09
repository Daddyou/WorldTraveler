# Script: Scene transition
extends Button

# exported global variables
export var next_scene:= ""
export var next_position = Vector2.ZERO

# onready global variables

# global variables

# main functions
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# sub functions


func transition_scene() ->void:
		GameManager.set_scene_to_load(next_scene)
		GameManager.load_new_scene()


func _on_Control_pressed():
	transition_scene()
