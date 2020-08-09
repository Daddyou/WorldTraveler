# Script: Dialoguebox
# Description: Script for the dialogue box
# Date: 2020-06-28

extends CanvasLayer

# preload constants

# constants
#var DIALOGUE_BOX_X_LONG= 0
var PORTRAIT_WIDTH = 47
var NAME_FIELD_POS_SHORT = 7
var NAME_FIELD_POS_LONG = 55
var DIALOGUE_BOX_WIDTH = 240
# enum defines

# onready variables
onready var window = $NormalDialogue
onready var dialogue_box = $NormalDialogue/DialogueField
onready var dialogue_text = $NormalDialogue/DialogueField/DialogueText
onready var name_box = $NormalDialogue/NameField
onready var speaker_name = $NormalDialogue/NameField/NameLabel
onready var portrait_box = $NormalDialogue/PortraitField
onready var portrait_image = $NormalDialogue/PortraitField/TextureRect
onready var dialogue_player = $DialoguePlayer

# export variables

# local variables
var active: bool = false
var dialogue_box_wide_size: bool = false
var display_name: bool = false
var dialogue_list:= [] 
var number_of_dialogues = 0
var current_dialogue = 0
var window_type = ""
# signals

# constructor and update
func _ready():

	pass # Replace with function body.

func _physics_process(delta) ->void:
	if active:
		if Input.is_action_just_pressed("attack"):
			dialogue_player.dialogue_next()

# functions
# Set a line of text and the name of the speaker into the dialogue box
func set_dialogue_box(speaker: String, portrait: String, list_of_dialogues: Array) ->void:
	Input.action_release("attack")
	dialogue_player.next_node()

# Activare or deactivate the dialogue box
func set_dialoguebox_state(new_state: bool) ->void:
	active = new_state
	window.visible = new_state
	# Set signals for true and false

func reset_dialogue_box() ->void:
	speaker_name.bbcode_text = ""
	dialogue_text.bbcode_text = ""
	number_of_dialogues = 0
	current_dialogue = 0

func load_dialogue(file_path: String) -> void:
	Input.action_release("attack")
	var dialogues = FileStream.load_json_file(file_path)
	dialogue_player.dialogue_start(dialogues)
	get_current_dialogue_player_data()	
	set_dialoguebox_state(true)

func get_current_dialogue_player_data() ->void:
	window_type = dialogue_player.get_node_type()
	if window_type == "show_message":
		show_message_box()
	
func show_message_box() ->void:
	var name_of_speaker: String= dialogue_player.get_speaker_name()
	var text_of_speaker: String= dialogue_player.get_speaker_dialogue()
	var speaker_portrait = false
	
	if speaker_portrait:
		dialogue_box.rect_position.x = PORTRAIT_WIDTH
		dialogue_box.rect_size.x = DIALOGUE_BOX_WIDTH
		name_box.rect_position.x = NAME_FIELD_POS_LONG
		portrait_box.visible = true	
	else:
		dialogue_box.rect_position.x = 0
		dialogue_box.rect_size.x = DIALOGUE_BOX_WIDTH + PORTRAIT_WIDTH
		name_box.rect_position.x = NAME_FIELD_POS_SHORT
		portrait_box.visible = false
		
	if name_of_speaker != "":
		name_box.visible = true
	else:
		name_box.visible = false
	
	speaker_name.bbcode_text = name_of_speaker
	dialogue_text.bbcode_text = text_of_speaker

# signal functions
func _on_DialoguePlayer_loading_dialogue_finished():
	get_current_dialogue_player_data()

func _on_DialoguePlayer_dialogue_ended():
	set_dialoguebox_state(false)
	reset_dialogue_box()
