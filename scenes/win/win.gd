extends CanvasLayer

@onready var cheery=preload("res://Pickups/Cheery/cherry.gd")
@onready var gem=preload("res://Pickups/Gem/gem.gd")
@onready var cherrylabel=$VBoxContainer/HBoxContainer/cherry
@onready var gemLabel=$VBoxContainer/HBoxContainer2/gem
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	gemLabel.text=str(gem.collected)+"out of 4"
	cherrylabel.text=str(cheery.collected)+"out of 18"
