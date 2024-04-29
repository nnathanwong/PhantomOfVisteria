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
	var poison : bool = false
	var burn : bool = false
	var bleed : bool = false
	var fear : bool = false
	var confusion : bool = false
	
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
	
	#Functions for status effects
	func isPoisoned(poison, hp, maxHP, defense):
		if poison == true:
			hp -= ceil(maxHP * 0.0625)
			defense = 8
		else:
			defense = 10
	
	func isBurned(burn, hp, maxHP, strength):
		if burn == true:
			hp -= ceil(maxHP * 0.0625)
			strength = 8
		else:
			strength = 16
	
	func isBleeding(bleed, hp, maxHP, strength):
		if bleed == true:
			hp -= ceil(maxHP * 0.08333)
		else:
			pass
			
	func isAfraid(fear):
		if fear == true:
			var scared : int = randi_range(0,2)
			return scared
		else:
			pass
			
	func isConfused(confusion):
		if confusion == true:
			var confused : int = randi_range(0,3)
			return confused
		else:
			pass
	
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
	var poison : bool = false
	var burn : bool = false
	var bleed : bool = false
	var fear : bool = false
	var confusion : bool = false
	
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
		
	func isPoisoned(poison, hp, maxHP, defense):
		if poison == true:
			hp -= ceil(maxHP * 0.0625)
			defense = 11
		else:
			defense = 14
	
	func isBurned(burn, hp, maxHP, strength):
		if burn == true:
			hp -= ceil(maxHP * 0.0625)
			strength = 3
		else:
			strength = 6
	
	func isBleeding(bleed, hp, maxHP, strength):
		if bleed == true:
			hp -= ceil(maxHP * 0.08333)
		else:
			pass
			
	func isAfraid(fear):
		if fear == true:
			var scared : int = randi_range(0,2)
			return scared
		else:
			pass
			
	func isConfused(confusion):
		if confusion == true:
			var confused : int = randi_range(0,3)
			return confused
		else:
			pass
		
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
	var poison : bool = false
	var burn : bool = false
	var bleed : bool = false
	var fear : bool = false
	var confusion : bool = false
	
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
		
	#Functions for status effects
	func isPoisoned(poison, hp, maxHP, defense):
		if poison == true:
			hp -= ceil(maxHP * 0.0625)
			defense = 12
		else:
			defense = 15
	
	func isBurned(burn, hp, maxHP, strength):
		if burn == true:
			hp -= ceil(maxHP * 0.0625)
			strength = 5
		else:
			strength = 10
	
	func isBleeding(bleed, hp, maxHP, strength):
		if bleed == true:
			hp -= ceil(maxHP * 0.08333)
		else:
			pass
			
	func isAfraid(fear):
		if fear == true:
			var scared : int = randi_range(0,2)
			return scared
		else:
			pass
			
	func isConfused(confusion):
		if confusion == true:
			var confused : int = randi_range(0,3)
			return confused
		else:
			pass
	
				
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
	var poison : bool = false
	var burn : bool = false
	var bleed : bool = false
	var fear : bool = false
	var confusion : bool = false
	
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
	
	#Functions for status effects
	func isPoisoned(poison, hp, maxHP, defense):
		if poison == true:
			hp -= ceil(maxHP * 0.0625)
			defense = 13
		else:
			defense = 16
	
	func isBurned(burn, hp, maxHP, strength):
		if burn == true:
			hp -= ceil(maxHP * 0.0625)
			strength = 6
		else:
			strength = 12
	
	func isBleeding(bleed, hp, maxHP, strength):
		if bleed == true:
			hp -= ceil(maxHP * 0.08333)
		else:
			pass
			
	func isAfraid(fear):
		if fear == true:
			var scared : int = randi_range(0,2)
			return scared
		else:
			pass
			
	func isConfused(confusion):
		if confusion == true:
			var confused : int = randi_range(0,3)
			return confused
		else:
			pass
	
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
