extends Label

func _ready():
	PlayerResources.write_to_text_log = add_text

func add_text(text_to_add: String, fade_time: float) -> void:
	# check for existing timers and delete
	if get_child_count() != 0:
		for child in get_children():
			child.queue_free()
	text = text_to_add
	var timer = Timer.new()
	timer.wait_time = fade_time
	timer.one_shot = true
	timer.autostart = false
	timer.timeout.connect(text_faded)
	add_child(timer)
	timer.start()


func text_faded() -> void:
	text = ""
