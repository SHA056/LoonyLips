extends Node

var player_words = []
#var story = "Detective: Hello! I'm detective %s. And you are?\nSuspect: %s\nDetective: You're here today under suspicion of second degree robbery.\nSuspect: %s!\nDetective: That's right. %s %s were stolen from %s. And the crime scene has your %s written all over it.\nSuspect: That is %s!\nDetective: Where were you on the night on %s?\nSuspect: We were watching %s!\nDetective: Then why does the security camera show you %s just %s away from the crime scene!\n\tAlright! I'm through with playing games. Where're you from?\nSuspect: %s.\nDetective: Just as I suspected. You know one of the best parts of being a detective is that I get to lock up criminals like you and go home to my children and my pet %s and say this town needs an %s.\nSuspect: Fine! I did it! I commited the robbery. But I only did it cause I needed the money to buy myself %s implants.\nDetective: I knew it all along! I knew it all along and everytime I solve a crime, I like to sing my favorite song %s.\n\t%s.\nSuspect: You have a %s voice! I love you!"
#var prompts = ["a male name", "your favorite teacher", "an exclamation", "a number", "a plural word", "a store name", "a body part", "a silly word", "a holiday", "a movie title", "a verb ending in 'ing'", "an amount of distance", "a country", "an animal", "a famous movie quote", "another body part", "a children's song", "2 lines of that song" , "an adjective"]

var story = "The best %s in the %s is an %s %s."
var prompts = ["a food", "a place", "an insult", "the same food"]

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText

func _ready ():
#	DisplayText.text = "Welcome to LoonyLips! We're gonna have so much fun!\n"
	check_player_word_length()
	

func _on_PlayerText_text_entered(new_text):
	add_to_player_words()
#	show_display(new_text)	
#	PlayerText.clear()
	

func _on_TextureButton_pressed():
	add_to_player_words()
#	var display = PlayerText.text
#	show_display(display)
	

#func show_display(input):
	

func add_to_player_words():
	player_words.append(PlayerText.text)
	PlayerText.clear()
	check_player_word_length()
	

func check_player_word_length():
	if is_story_done():
		tell_story()
	else:
		prompt_word()
	
func is_story_done():
	return player_words.size() == prompts.size()
	
func tell_story():
	DisplayText.text = story % player_words
	
func prompt_word():
	DisplayText.text = "Give me " + prompts[player_words.size()] + "."

		

	