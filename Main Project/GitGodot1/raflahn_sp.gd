extends ProgressBar

func _ready():
	max_value = PartyMemberStats.raflahn_sp
	value = PartyMemberStats.raflahn_sp

func _process(delta):
	signals.update_sp.connect(change_value)

func change_value(character_sp):
	if BattleInstance.current_turn == 2:
		value = character_sp
