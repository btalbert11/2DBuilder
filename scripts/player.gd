class_name Player
extends CharacterBody2D

# For movement, TODO edit this to get from game Node/Global
@export var grid_size: int = 80
var move_hold_timer: float = 0
var move_continous: float = 5
@onready var ray = $RayCast2D
var last_direction_pressed: String = ""
# Attack for damaging resources
var attack: Attack
var damage = 1
# Movement Signal
signal moved_to(grid_location: Vector2)
# For the player menu
var ignore_movement: bool = false
# For interactable objects in the game
var current_tile: Node = null : set = _set_current_tile, get = _get_current_tile
# Player equipment
var has_axe: bool = false

var inputs = {
	"up" : Vector2.UP,
	"down" : Vector2.DOWN,
	"left" : Vector2.LEFT,
	"right" : Vector2.RIGHT,
}

func _ready():
	# Set attack
	attack = Attack.new()
	attack.damage = damage

	# Give a perminent refrence to the global object
	PlayerResources.PLAYER_NODE = self

func _physics_process(delta):
	if ignore_movement:
		return
	if last_direction_pressed != "":
		if Input.is_action_pressed(last_direction_pressed):
			move_hold_timer += delta
			if move_hold_timer >= 0.3:
				move_continous += delta
				if move_continous >= 0.15:
					move(last_direction_pressed)
					move_continous = 0

func _unhandled_input(event):
	# If menu is open
	if ignore_movement:
		return
	# Handle Movement
	for dir in inputs:
		if event.is_action_pressed(dir):
			move(dir)
			last_direction_pressed = dir
			move_hold_timer = 0
			move_continous = 5
	# if last_direction_pressed == "":
	# 	return
	if last_direction_pressed != "" && event.is_action_released(last_direction_pressed):
		last_direction_pressed = ""
		move_hold_timer = 0
		move_continous = 5
	# Handle Interacting
	if Input.is_action_just_pressed("player_interact") && current_tile != null:
		current_tile.player_interact()


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

func toggle_label_on():
	if current_tile is InteractableNode:
		$Control/Interactable.text = current_tile.get_player_text()
		$Control/Interactable.visible = true

func toggle_label_off():
	$Control/Interactable.visible = false

func _set_current_tile(new_tile):
	current_tile = new_tile

func _get_current_tile():
	return current_tile

func _on_search_interactable_area_entered(area):
	var top = area.get_owner()
	if top is InteractableNode:
		current_tile = top
		toggle_label_on()	

func _on_search_interactable_area_exited(area):
	var top = area.get_owner()
	if top == current_tile:
		toggle_label_off()
		current_tile = null
