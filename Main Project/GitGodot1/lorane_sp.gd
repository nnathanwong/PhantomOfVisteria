extends ProgressBar

func _ready():
	max_value = PartyMemberStats.lorane_sp
	value = PartyMemberStats.lorane_sp

func _process(delta):
	signals.update_sp.connect(change_value)

func change_value(character_sp):
	if BattleInstance.current_turn == 1:
		value = character_sp
