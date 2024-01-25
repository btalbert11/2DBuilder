extends CharacterBody2D

@export var wood_amount: int = 20


func take_attack(attack: Attack):
	$HealthComponent.take_damage(attack.damage)

func _on_health_component_no_health(current_health):
	PlayerResources.wood += wood_amount
	delete_self()

func delete_self():
	queue_free()
