# shadow_AI

extends Node

onready var parent = get_parent()

func _ready():
	parent.ai = self

func take_turn():
	if parent.fighter.has_status_effect('confused'):
		pass
	var target = GameData.player
	var distance = parent.distance_to(target.get_map_position())
	if distance <= GameData.player_radius:
		if distance <= 1:
			parent.fighter.fight(target)
		else:
			parent.step_to(target.get_map_position())
	else:
		wander()

func wander():
	var UP = randi()%2
	var DOWN = randi()%2
	var LEFT = randi()%2
	var RIGHT = randi()%2
	var dir = Vector2( RIGHT-LEFT, DOWN-UP )
	parent.step(dir)
