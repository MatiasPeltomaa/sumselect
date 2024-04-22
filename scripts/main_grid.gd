extends GridContainer

var apple_1 = preload("res://scenes/apple_1.tscn").instantiate()
var apple_2 = preload("res://scenes/apple_2.tscn").instantiate()
var apple_3 = preload("res://scenes/apple_3.tscn").instantiate()
var apple_4 = preload("res://scenes/apple_4.tscn").instantiate()
var apple_5 = preload("res://scenes/apple_5.tscn").instantiate()
var apple_6 = preload("res://scenes/apple_6.tscn").instantiate()
var apple_7 = preload("res://scenes/apple_7.tscn").instantiate()
var apple_8 = preload("res://scenes/apple_8.tscn").instantiate()
var apple_9 = preload("res://scenes/apple_9.tscn").instantiate()

func _ready():
	add_child(apple_1)
	add_child(apple_2)

func _process(delta):
	pass
