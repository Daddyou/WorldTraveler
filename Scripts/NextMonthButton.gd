# Script: NextMonthButton.gd
# Description: Button Script to start the next month
# Date: 2020-08-05

extends Button

# preload constants

# constants

# enum defines

# onready variables

# export variables

# local variables

# signals

# constructor and update
func _ready():
	pass # Replace with function body.

#func _process(delta):
#	pass

# functions
# Start the next month
func next_month():
	if GameManager.month > 0 && GameManager.month < 12:
		GameManager.month += 1
	else:
		GameManager.month = 1
		GameManager.year += 1
		
# signal function
func _on_NextMonthButton_pressed():
	next_month()
