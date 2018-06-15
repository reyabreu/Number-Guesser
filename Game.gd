extends Node

# 0 ~ 1000
var guess

var min_guessed = 0;
var max_guessed = 1000

var try_again = false;

func _ready():
	guess = (min_guessed + max_guessed) / 2
	print("---------------------------")
	print("---------------------------")
	print("---------------------------")
	print("Hello from Number Guesser")
	print("I'll guess any number that you think between 0 and 1000")
	print("Is " + str(guess) + " your number?")

func _process(delta):
	if Input.is_action_just_pressed("up"):
		_handle_action("up")
	elif Input.is_action_just_pressed("down"):
		_handle_action("down")
	elif Input.is_action_just_pressed("restart"):
		if try_again:
			_restart_game()
		else:
			_end_game()

func _end_game():
	try_again = true	
	print ("Yes! I knew youre number was " + str(guess) + "!")	

func _restart_game():
	get_tree().reload_current_scene()

func _handle_action(action):
	if action == "up":
		min_guessed = guess
	else:
		max_guessed = guess
	guess = (min_guessed + max_guessed) / 2
	print("Is " + str(guess) + " your number?")