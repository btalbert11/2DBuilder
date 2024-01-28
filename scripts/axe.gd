extends InteractableNode

func _ready():
	player_text = "Pickup Axe"

func player_interact():
	PlayerResources.player_has_axe = true
	delete_self()

func get_player_text():
	return player_text

func delete_self():
	queue_free()
