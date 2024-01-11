extends Camera2D

var grid_size = 80
var camera_size = Vector2(14, 8)

var camera_movement_vectors = {
	"left" : Vector2(-grid_size*camera_size.x, 0),
	"right" : Vector2(grid_size*camera_size.x, 0),
	"up" : Vector2(0, - grid_size*camera_size.y),
	"down" : Vector2(0, grid_size*camera_size.y),
}


func _on_left_boundary_body_entered(body):
	if body is Player:
		global_position += camera_movement_vectors["left"]



func _on_right_boundary_body_entered(body):
	if body is Player:
		global_position += camera_movement_vectors["right"]

func _on_up_boundary_body_entered(body):
	if body is Player:
		global_position += camera_movement_vectors["up"]

func _on_down_boundary_body_entered(body):
	if body is Player:
		global_position += camera_movement_vectors["down"]
