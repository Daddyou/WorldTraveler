# Script: FileStream.gd
# Description: FileStream script for all json files
# Date: 2020-07-05

extends Node

# preload constants

# constants

# enum defines

# onready variables

# export variables

# local variables

# signals

# constructor and update
#func _ready():
#	pass # Replace with function body.

#func _process(delta):
#	pass

# functions

func load_json_file(file_path: String) ->Dictionary:
	var file = File.new()
	var parsed_data_dictionary:Dictionary
	if file.file_exists(file_path):
		file.open(file_path, file.READ)
		var data_text = file.get_as_text()
		file.close()
		var data_parse = JSON.parse(data_text)
		if data_parse.error == OK:
			var parsed_data_array = data_parse.result
			parsed_data_dictionary = parsed_data_array[0]			
	return parsed_data_dictionary
# signal functions
