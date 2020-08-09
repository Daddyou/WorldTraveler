# Script: DialoguePlayer.gd
# Description: Player for all dialogues in the game
# Date: 2020-07-05

extends Control

# preload constants

# constants

# enum defines

# onready variables

# export variables

# local variables
var speaker_name: String = ""
var speaker_text: String = ""
var next_node: String = ""
var node_type: String = ""
var node_name: String = ""
var current_node: Dictionary

var dialogue_nodes: Array
var variables_node: Dictionary
var number_of_dialogue_nodes: int = 0
var current_index: int = 0

# signals
signal loading_dialogue_finished
signal dialogue_ended

# constructor and update
#func _ready():
#	pass # Replace with function body.

#func _process(delta):
#	pass

# functions

func dialogue_start(dialogue_dictionary: Dictionary) ->void:
	build_nodes(dialogue_dictionary)
	current_node = get_dialogue_node("START")	
	process_node(current_node)
	current_node = get_dialogue_node(next_node)
	process_node(current_node)

func dialogue_next() ->void:
	if next_node != "null":
		current_node = get_dialogue_node(next_node)
		process_node(current_node)
		emit_signal("loading_dialogue_finished")
	else:
		dialogue_end()
		emit_signal("dialogue_ended")

func dialogue_end() ->void:
	speaker_name = ""
	speaker_text = ""
	next_node = ""
	node_type = ""
	node_name = ""
	current_node.clear()
	number_of_dialogue_nodes = 0
	current_index = 0
	

# Builds the dialogue nodes and variable nodes and saves them into variables
func build_nodes(dialogue_dictionary: Dictionary):
	var dictionary_values = dialogue_dictionary.values()
	dialogue_nodes = dictionary_values[0]
	variables_node = dictionary_values[1]
	number_of_dialogue_nodes = dialogue_nodes.size()

# Returns the start node of an dialogue
func get_dialogue_node(node_name: String) -> Dictionary:
	var start_node: Dictionary
	for node in dialogue_nodes:
		if (node["node_name"] == node_name):
			start_node = node
			break
		current_index += 1 # not used, but for the future still implemented
	return start_node

func process_node(node: Dictionary):
	node_type = node["node_type"]
	node_name = node["node_name"]
	if (node["next"] != null):
		next_node = node["next"]
	else:
		next_node = "null"
	if node_type == "start":
		pass
	elif node_type == "show_message":
		process_show_message_node(node)	

func process_show_message_node(node: Dictionary):
	speaker_name = node["character"][0]
	speaker_text = node["text"][GameManager.language]

func get_speaker_name() -> String:
	return speaker_name

func get_speaker_dialogue() ->String:
	return speaker_text
	
func get_node_type() ->String:
	return node_type
# signal functions
