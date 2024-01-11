class_name Player
extends CharacterBody2D

@export var grid_size: int = 80
@onready var ray = $RayCast2D
var attack: Attack
var damage = 1

signal moved_to(grid_location: Vector2)

var move_hold_timer: float = 0
var move_continous: float = 5
var last_direction_pressed: String = ""

var inputs = {
	"up" : Vector2.UP,
	"down" : Vector2.DOWN,
	"left" : Vector2.LEFT,
	"right" : Vector2.RIGHT,
}

func _ready():
	attack = Attack.new()
	attack.damage = damage


func _physics_process(delta):
	if last_direction_pressed != "":
		if Input.is_action_pressed(last_direction_pressed):
			move_hold_timer += delta
			if move_hold_timer >= 0.3:
				move_continous += delta
				if move_continous >= 0.15:
					move(last_direction_pressed)
					move_continous = 0

func _unhandled_input(event):
	for item in inputs:
		if event.is_action_pressed(item):
			move(item)
			last_direction_pressed = item
			move_hold_timer = 0
			move_continous = 5
	if last_direction_pressed == "":
		return
	elif event.is_action_released(last_direction_pressed):
		last_direction_pressed = ""
		move_hold_timer = 0
		move_continous = 5


func move(direction):
	var input_vector = inputs[direction] * grid_size
	ray.target_position = input_vector
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += input_vector
		moved_to.emit(global_position)
	else:
		var obj = ray.get_collider()
		if obj.has_node("./HealthComponent"):
			obj.take_attack(attack)
