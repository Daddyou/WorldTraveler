# Script: PlayerStats
# Description: 
# Date: 2020-07-21

extends Node

# preload constants

# constants

# enum defines
enum {
	NONE,
	MALE,
	FEMALE,
	DIVERSE
}

enum {
	HETERO,
	HOMO,
	BI
}

enum {
	TODDLER,
	CHILD,
	TEEN,
	ADULT
}

# onready variables

# export variables
export var npc_name: String = "" 
export var npc_sur_name: String = ""
export var gender = NONE
export var age: int = 0
export var sexuality: int = HETERO
export var fuckable: bool = false
export var life_state: int = ADULT

export (String, FILE, "*.json") var dialogue_file_path: String
# local variables

# signals

# constructor and update
func _ready():
	pass # Replace with function body.

#func _process(delta):
#	pass

# functions
# Interact with the interactable
func interact():
	dialogue()
	action()
	pass

# Do a dialogue, if interacted
func dialogue():	
	if check_if_dialogue_box_exists() == true:
		var dialogue_box = get_tree().current_scene.get_node("DialogueBox")
		dialogue_box.load_dialogue(dialogue_file_path)		
	else:
		print_debug("Interactable: DialogueBox not found in the curent scene")

func check_if_dialogue_box_exists() ->bool:
	var tree = get_tree().current_scene
	var dialoguebox_available = get_tree().current_scene.has_node("DialogueBox")
	return dialoguebox_available

# Action, if interacted
func action():
	pass

# signal functions
