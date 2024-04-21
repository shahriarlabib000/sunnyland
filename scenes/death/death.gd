extends CanvasLayer


@onready var cheery=preload("res://Pickups/Cheery/cherry.gd")
@onready var gem=preload("res://Pickups/Gem/gem.gd")
@onready var cherrylabel=$VBoxContainer/HBoxContainer/cherry
@onready var gemLabel=$VBoxContainer/HBoxContainer2/gem
var green:Color=Color("green")

func _ready() -> void:
	if(gem.collected==4):
		gemLabel.add_theme_color_override("font_color",green)
	if(cheery.collected==18):
		cherrylabel.add_theme_color_override("font_color",green)
		
	gemLabel.text=str(gem.collected)+"/4"
	cherrylabel.text=str(cheery.collected)+"/18"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("reload"):
		gem.collected=0
		cheery.collected=0
		get_tree().reload_current_scene()
	
