extends Resource

class_name PartyStats

class Ancel:
	# Max stats
	var maxHP : int = 100
	var maxSP : int = 10
	
	# Current stats
	var hp : int = maxHP
	var sp : int = maxSP
	var defense : int = 10
	var strength : int = 16
	var magic : int = 3
	
	#Returns max HP and SP
	func returnMaxHP():
		return maxHP
	func returnMaxSP():
		return maxSP
	
	#Returns all current stats
	func returnHP():
		return hp
	func returnSP():
		return sp
	func returnDefense():
		return defense
	func returnStrength():
		return strength
	func returnMagic():
		return magic
		
	#Damage inflicted on Ancel
	func takeDamage(hp, damage):
		hp -= damage
		if hp < 0:
			hp = 0
		return hp
	#Healing
	func restoreHP(hp, heal):
		hp += heal
		if hp > maxHP:
			hp = maxHP
		return hp
	#Spending SP
	func spSpend(sp, cost):
		if cost > sp:
			print("Cost greater than SP")
			return
		sp -= cost
		return sp
	#Restoring SP
	func restoreSP(sp, restore):
		sp += restore
		if sp > maxSP:
			sp = maxSP
		return sp
	
	#Levelling stats by REPLACING max stats with new max
	func levelHP(maxHP, new):
		maxHP = new
		return maxHP
	func levelSP(maxSP, new):
		maxSP = new
		return maxSP
	func levelDefense(defense, new):
		defense = new
		return defense
	func levelStrength(strength, new):
		strength = new
		return strength
	func levelMagic(magic, new):
		magic = new
		return magic
	
class Lorane:
	# Max stats
	var maxHP : int = 126
	var maxSP : int = 40
	
	# Current stats
	var hp : int = maxHP
	var sp : int = maxSP
	var defense : int = 14
	var strength : int = 6
	var magic : int = 21
	
	#Returns max HP and SP
	func returnMaxHP():
		return maxHP
	func returnMaxSP():
		return maxSP
	
	#Returns all current stats
	func returnHP():
		return hp
	func returnSP():
		return sp
	func returnDefense():
		return defense
	func returnStrength():
		return strength
	func returnMagic():
		return magic
		
	#Damage inflicted
	func takeDamage(hp, damage):
		hp -= damage
		if hp < 0:
			hp = 0
		return hp
	#Healing
	func restoreHP(hp, heal):
		hp += heal
		if hp > maxHP:
			hp = maxHP
		return hp
	#Spending SP
	func spSpend(sp, cost):
		if cost > sp:
			print("Cost greater than SP")
			return
		sp -= cost
		return sp
	#Restoring SP
	func restoreSP(sp, restore):
		sp += restore
		if sp > maxSP:
			sp = maxSP
		return sp
		
	#Levelling stats by REPLACING max stats with new max
	func levelHP(maxHP, new):
		maxHP = new
		return maxHP
	func levelSP(maxSP, new):
		maxSP = new
		return maxSP
	func levelDefense(defense, new):
		defense = new
		return defense
	func levelStrength(strength, new):
		strength = new
		return strength
	func levelMagic(magic, new):
		magic = new
		return magic

class Raflahn:
	# Max stats
	var maxHP : int = 180
	var maxSP : int = 50
	
	# Current stats
	var hp : int = maxHP
	var sp : int = maxSP
	var defense : int = 15
	var strength : int = 10
	var magic : int = 24
	
	#Returns max HP and SP
	func returnMaxHP():
		return maxHP
	func returnMaxSP():
		return maxSP
	
	#Returns all current stats
	func returnHP():
		return hp
	func returnSP():
		return sp
	func returnDefense():
		return defense
	func returnStrength():
		return strength
	func returnMagic():
		return magic
		
	#Damage inflicted
	func takeDamage(hp, damage):
		hp -= damage
		if hp < 0:
			hp = 0
		return hp
	#Healing
	func restoreHP(hp, heal):
		hp += heal
		if hp > maxHP:
			hp = maxHP
		return hp
	#Spending SP
	func spSpend(sp, cost):
		if cost > sp:
			print("Cost greater than SP")
			return
		sp -= cost
		return sp
	#Restoring SP
	func restoreSP(sp, restore):
		sp += restore
		if sp > maxSP:
			sp = maxSP
		return sp
		
	#Levelling stats by REPLACING max stats with new max
	func levelHP(maxHP, new):
		maxHP = new
		return maxHP
	func levelSP(maxSP, new):
		maxSP = new
		return maxSP
	func levelDefense(defense, new):
		defense = new
		return defense
	func levelStrength(strength, new):
		strength = new
		return strength
	func levelMagic(magic, new):
		magic = new
		return magic

class Younn:
	# Max stats
	var maxHP : int = 230
	var maxSP : int = 20
	
	# Current stats
	var hp : int = maxHP
	var sp : int = maxSP
	var defense : int = 12
	var strength : int = 16
	var magic : int = 18
	
	#Returns max HP and SP
	func returnMaxHP():
		return maxHP
	func returnMaxSP():
		return maxSP
	
	#Returns all current stats
	func returnHP():
		return hp
	func returnSP():
		return sp
	func returnDefense():
		return defense
	func returnStrength():
		return strength
	func returnMagic():
		return magic
		
	#Damage inflicted
	func takeDamage(hp, damage):
		hp -= damage
		if hp < 0:
			hp = 0
		return hp
	#Healing
	func restoreHP(hp, heal):
		hp += heal
		if hp > maxHP:
			hp = maxHP
		return hp
	#Spending SP
	func spSpend(sp, cost):
		if cost > sp:
			print("Cost greater than SP")
			return
		sp -= cost
		return sp
	#Restoring SP
	func restoreSP(sp, restore):
		sp += restore
		if sp > maxSP:
			sp = maxSP
		return sp
		
	#Levelling stats by REPLACING max stats with new max
	func levelHP(maxHP, new):
		maxHP = new
		return maxHP
	func levelSP(maxSP, new):
		maxSP = new
		return maxSP
	func levelDefense(defense, new):
		defense = new
		return defense
	func levelStrength(strength, new):
		strength = new
		return strength
	func levelMagic(magic, new):
		magic = new
		return magic
