# Script: InteractSubMenu
# Description: Script for the sub menu of the interaction menu
# Date: 2020-08-09

extends Control

# preload constants

# constants

# enum defines

# onready variables

# export variables

# local variables
var this_npc

# signals
signal open_interaction_main_menu

# constructor and update
func _ready():
	pass # Replace with function body.

#func _process(delta):
#	pass

# functions

# signal functions

func _on_TalkButton_pressed():
	pass # Replace with function body.


func _on_GiftButton_pressed():
	pass # Replace with function body.


func _on_ActionButton_pressed():
	pass # Replace with function body.


func _on_LeaveButton_pressed():
	emit_signal("open_interaction_main_menu")
