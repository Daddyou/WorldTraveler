# Script: NPCListMenu.gd
# Description: Listing of all NPCs
# Date: 2020-08-09

extends Control

# preload constants

# constants
const NPC_INTERACT_BUTTON = preload("res://Scenes/UI/NPCInteractButton.tscn")
const POS_Y_OFFSET = 5
const DEFAULT_POS_Y = 85

# enum defines

# onready variables

# export variables
export var npc_name: String = ""

# local variables
var this_npc

# signals

# constructor and update
func _ready():
	pass

#func _process(delta):
#	pass

# functions
# Initiate the button and load the player
func load_buttons():
	var NPCs_available = get_tree().current_scene.has_node("NPCs")
	if NPCs_available == true:
		var npc_list = get_tree().current_scene.get_node("NPCs")
		#var number_of_npcs = get_tree().current_scene.get_node("NPCs").get_child_count()
		this_npc = npc_list.get_child(0)

func load_button(npc):
	this_npc = npc
	text = this_npc.npc_name + " " + this_npc.npc_sur_name

# Start the interaction with the NPC
func interact():
	this_npc.visible = !this_npc.visible

func get_number_of_npcs() ->int:
	var number_of_npcs:int = 0
	var NPCs_available = get_tree().current_scene.has_node("NPCs")
	if NPCs_available == true:
		var npc_list = get_tree().current_scene.get_node("NPCs")
		number_of_npcs = get_tree().current_scene.get_node("NPCs").get_child_count()
	return number_of_npcs

func load_buttons() -> void:
	var number_of_npcs: int = get_number_of_npcs()
	var npc_list = get_tree().current_scene.get_node("NPCs")
	for index in number_of_npcs:
		var npc_button = NPC_INTERACT_BUTTON.instance()
		add_child(npc_button)
		npc_button.rect_position.x = (GameManager.WINDOW_SIZE_X / 2) - (npc_button.rect_size.x / 2)
		npc_button.rect_position.y = DEFAULT_POS_Y - (index * (npc_button.rect_size.y + POS_Y_OFFSET))
		npc_button.load_button(npc_list.get_child(index))
# signal functions


func _on_NPCInteract_pressed():
	interact()
