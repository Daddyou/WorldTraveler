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
	FEMALE
}

enum {
	TODDLER,
	CHILD,
	TEEN,
	ADULT
}
# onready variables

# export variables
export var player_name: String = "" 
export var sur_name: String = ""
export var gender = NONE
export var age: int = 0
export var life_state: int = TODDLER

export var hp: int = 0
export var max_hp: int = 0
export var mp: int = 0
export var max_mp: int = 0
export var strength: int = 0
export var constitution: int = 0
export var dexterity: int = 0
export var intelligence: int = 0
export var charisma: int = 0

export var skill_sword: int = 0
export var skill_box: int = 0
export var skill_crossbow: int = 0
export var skill_staff: int = 0
export var skill_magic: int = 0

# local variables

# signals

# constructor and update

# signal functions
