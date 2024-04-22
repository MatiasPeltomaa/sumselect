extends Node2D

var rng = RandomNumberGenerator.new()

func _ready():
	var random_number = rng.randi_range(1, 9)
	
	if (random_number == 1):
		var apple_1 = preload("res://scenes/apple_1.tscn").instantiate()
		add_child(apple_1)
	if (random_number == 2):
		var apple_2 = preload("res://scenes/apple_2.tscn").instantiate()
		add_child(apple_2)
	if (random_number == 3):
		var apple_3 = preload("res://scenes/apple_3.tscn").instantiate()
		add_child(apple_3)
	if (random_number == 4):
		var apple_4 = preload("res://scenes/apple_4.tscn").instantiate()
		add_child(apple_4)
	if (random_number == 5):
		var apple_5 = preload("res://scenes/apple_5.tscn").instantiate()
		add_child(apple_5)
	if (random_number == 6):
		var apple_6 = preload("res://scenes/apple_6.tscn").instantiate()
		add_child(apple_6)
	if (random_number == 7):
		var apple_7 = preload("res://scenes/apple_7.tscn").instantiate()
		add_child(apple_7)
	if (random_number == 8):
		var apple_8 = preload("res://scenes/apple_8.tscn").instantiate()
		add_child(apple_8)
	if (random_number == 9):
		var apple_9 = preload("res://scenes/apple_9.tscn").instantiate()
		add_child(apple_9)

func _process(_delta):
	pass
