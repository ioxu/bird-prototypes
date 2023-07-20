extends Node2D

#var player : Player

@export var player : Player
@onready var player_energy_bar : ProgressBar = $Control/player_energy_bar

func _ready():
	#player = self.get_parent().get_node("world").find_child("player")
	print("player_ui.player: %s"%player)
	player.energy_changed.connect( _on_player_energy_changed )
	player_energy_bar.value = player.energy
	player_energy_bar.max_value = player.energy_max


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_energy_changed(arg:float) -> void:
	player_energy_bar.value = arg
