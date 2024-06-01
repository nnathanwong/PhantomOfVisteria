extends ProgressBar

func _ready():
	max_value = PartyMemberStats.younn_sp
	value = PartyMemberStats.younn_sp

func _process(delta):
	signals.update_sp.connect(change_value)

func change_value(character_sp):
	if BattleInstance.current_turn == 3:
		value = character_sp
