extends Label

func _ready():
	PlayerResources.wood_update_callbacks.append(update_wood)

func update_wood():
	text = "Wood: " + str(PlayerResources.wood)
