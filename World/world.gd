extends Node2D

@onready var cam=$Player/Camera2D
@onready var ui=$Player/Camera2D/ui
@onready var player=$Player
@onready var deathTSCN=preload("res://scenes/death/death.tscn")
@onready var winTscn=preload("res://scenes/win/win.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_dead() -> void:
	ui.visible=false
	cam.add_child(deathTSCN.instantiate())


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		ui.visible=false
		cam.add_child(winTscn.instantiate())
		player.won()
