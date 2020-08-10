# Script: InteractionMenu.gd
# Description: Script for the interaction menu to do actions and interactions with NPCs
# Date: 2020-08-09

extends Control

# preload constants

# constants

# enum defines

# onready variables
onready var main_interaction_menu = $MainInteractionMenu
onready var action_button = $MainInteractionMenu/ActionButton
onready var interaction_button = $MainInteractionMenu/InteractButton
onready var interaction_sub_menu = $InteractSubMenu

# export variables

# local variables

# signals

# constructor and update
func _ready() ->void:
	pass # Replace with function body.

#func _process(delta):
#	pass

# functions
func open_interaction_sub_menu() ->void:
	main_interaction_menu.visible = false
	interaction_sub_menu.visible = true

func open_interaction_main_menu():
	interaction_sub_menu.visible = false
	main_interaction_menu.visible = true
	

# signal functions
func _on_InteractButton_pressed() ->void:
	open_interaction_sub_menu()

func _on_ActionButton_pressed() ->void:
	pass # Replace with function body.

func _on_InteractSubMenu_open_interaction_main_menu():
	open_interaction_main_menu()
