extends CanvasLayer

@onready var cheery=preload("res://Pickups/Cheery/cherry.gd")
@onready var gem=preload("res://Pickups/Gem/gem.gd")
@onready var cherrylabel=$VBoxContainer/HBoxContainer/cherry
@onready var gemLabel=$VBoxContainer/HBoxContainer2/gem
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	gemLabel.text=str(gem.collected)
	cherrylabel.text=str(cheery.collected)
