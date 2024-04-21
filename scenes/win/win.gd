extends CanvasLayer

@onready var cheery=preload("res://Pickups/Cheery/cherry.gd")
@onready var gem=preload("res://Pickups/Gem/gem.gd")
@onready var cherrylabel=$VBoxContainer/HBoxContainer/cherry
@onready var gemLabel=$VBoxContainer/HBoxContainer2/gem


var green:Color=Color("green")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	if(gem.collected==4):
		gemLabel.add_theme_color_override("font_color",green)
	if(cheery.collected==18):
		cherrylabel.add_theme_color_override("font_color",green)
	gemLabel.text=str(gem.collected)+" out of 4"
	cherrylabel.text=str(cheery.collected)+" out of 18"


func _on_button_pressed() -> void:
	gem.collected=0
	cheery.collected=0
	get_tree().reload_current_scene()
	
