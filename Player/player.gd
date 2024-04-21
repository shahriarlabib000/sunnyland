extends CharacterBody2D


const SPEED = 110.0
const JUMP_VELOCITY = -300.0
signal dead
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var dearhTscn=preload("res://scenes/death/death.tscn")
var alive=true
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if position.y> 360 ||position.y < -100:
		death()
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction (input_axis) and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_axis = Input.get_axis("ui_left", "ui_right")
	if input_axis:
		velocity.x = input_axis * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	update_animations(input_axis)


func update_animations(input_axis):
	if alive:
		if input_axis != 0:
			animated_sprite_2d.flip_h = input_axis < 0
			animated_sprite_2d.play("run")
		else:
			animated_sprite_2d.play("idle")
		
		if not is_on_floor():
			if velocity.y < 0:
				animated_sprite_2d.play("jump")
			else:
				animated_sprite_2d.play("fall")

func death():
	emit_signal("dead")
	alive=false
	animated_sprite_2d.play("death")
	