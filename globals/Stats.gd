extends Node

# variables
var money : int = 1000
var wave : int = 1

# signals
signal money_changed
signal wave_changed

# changers
func change_money(amount: int) -> bool:
	if money + amount < 0:
		print("NOT ENOUGH MONEY!")
		return false
	
	money += amount
	money_changed.emit()
	
	return true

func next_wave():
	wave += 1
	wave_changed.emit()
