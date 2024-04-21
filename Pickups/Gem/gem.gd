extends Area2D

@onready var scene_to_spawn = preload("res://Pickups/Feedback/feedback.tscn")

static var collected:=0

func _ready() -> void:
	pass

func spawn_feedback():
	var new_scene_instance = scene_to_spawn.instantiate()
	get_tree().current_scene.add_child(new_scene_instance)  # Add the instance as a child of the current scene
	new_scene_instance.global_position = global_position




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		spawn_feedback()
		queue_free()
		collected+=1
