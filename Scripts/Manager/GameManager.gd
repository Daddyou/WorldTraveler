# Script: Name
# Description: 
# Date: yyyy-mm-dd

extends Node

# preload constants

# constants
const ENG:String = "ENG"

const WINDOW_SIZE_X: int = 320
const WINDOW_SIZE_Y: int = 180
# enum defines

# onready variables

# export variables
export var month: int = 1
export var year: int = 0
export var money: int = 100

# local variables
var scene_to_load:= ""
var language = ENG
# signals

# constructor and update
func _ready():
	pass # Replace with function body.

#func _process(delta):
#	pass
# functions
func set_scene_to_load(new_scene: String):
	scene_to_load = new_scene
	
func load_new_scene():
	get_tree().change_scene(scene_to_load)
	pass
# signal functions
