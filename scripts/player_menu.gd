extends TabContainer



func _ready():
	# register callback functions to global data
	PlayerResources.wood_update_callbacks["player_menu_show_spear_crafting"] = show_spear_crafting
	PlayerResources.wood_update_callbacks["player_menu_show_club_crafting"] = show_club_crafting
	PlayerResources.wood_update_callbacks["player_menu_show_house_crafting"] = show_house_crafting
	PlayerResources.wood_update_callbacks["player_menu_show_paper_crafting"] = show_paper_crafting
	pass
	

func show_spear_crafting():
	$Crafting/GridContainer/Spear.visible = true
	if (!PlayerResources.wood_update_callbacks.erase("player_menu_show_spear_crafting")):
		push_error("CALLBACK MISSING")

func show_club_crafting():
	$Crafting/GridContainer/Club.visible = true
	if (!PlayerResources.wood_update_callbacks.erase("player_menu_show_club_crafting")):
		push_error("CALLBACK MISSING")

func show_house_crafting():
	$Crafting/GridContainer/House.visible = true
	if (!PlayerResources.wood_update_callbacks.erase("player_menu_show_house_crafting")):
		push_error("CALLBACK MISSING")

func show_paper_crafting():
	$Crafting/GridContainer/Paper.visible = true
	if (!PlayerResources.wood_update_callbacks.erase("player_menu_show_paper_crafting")):
		push_error("CALLBACK MISSING")

		
func _on_spear_button_down():
	GlobalSignals.craft_spear.emit()
	# PlayerResources.player_has_spear = true
	# $Crafting/GridContainer/Spear.visible = false
	# PlayerResources.write_to_text_log.call("You crafted a spear! Maybe try fishing?", 10)

func _on_club_button_down():
	pass # Replace with function body.


func _on_house_button_down():
	pass # Replace with function body.


func _on_paper_button_down():
	pass # Replace with function body.
