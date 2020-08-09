# Script: NPCInteract.gd
# Description: Interact button for NPCs
# Date: 2020-08-09

extends Button

# preload constants

# constants

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
	#load_button()

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
		text = this_npc.npc_name + " " + this_npc.npc_sur_name

func load_button(npc):
	this_npc = npc
	text = this_npc.npc_name + " " + this_npc.npc_sur_name

# Start the interaction with the NPC
func interact():
	this_npc.visible = !this_npc.visible
# signal functions


func _on_NPCInteract_pressed():
	interact()
