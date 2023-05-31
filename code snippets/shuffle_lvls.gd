#THESE ARE ONLY CODE SNIPPETS on how Fisher-Yates algorithm was used to create a unique level selection system for the rhythm game

#create a variable to check the current level and an instance variable to create the new chosen level (replacing the current lvl)
var chosen_index
var instance

#for the rhythm game, the FY is using the number of stars collected and a correct quiz answer to create a new level
var star_checker = 0
var quiz_checker = 0

#function implementing fisher-yates algorithm and adding/removing lvls in easy difficulty
func fisher_yates():
	randomize()
# warning-ignore:unused_variable
	for item in range(i, size):
		#get random index
		randomIndex = randi() % size
		#swap value
		var temp = easy_lvl[i]
		easy_lvl[i] = easy_lvl[randomIndex]
		easy_lvl[randomIndex] = temp
		i+=1
	#update the current lvl tracker
	Global.others["ez_lvl_tracker"] = randomIndex