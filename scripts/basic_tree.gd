extends ResourceNode



# Called when the node enters the scene tree for the first time.
func _ready():
	player_text = "Chop Wood"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func player_interact(player: Node2D):
	if PlayerResources.player_has_axe:
		PlayerResources.wood += 1

func get_player_text():
	if !PlayerResources.player_has_axe:
		return "Need an Axe"
	return player_text
	
