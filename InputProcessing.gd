extends Node

@export var score_label:Node
@export var instructions_label:Node
@export var end_message_label:Node
@export var target_node:Node
@export var camera:Node
@export var middle_block_tree:PackedScene
@export var top_block_hair_brown:PackedScene

@export var leaderboard_slot:PackedScene


var score = 0
var timer = 1
var height = 430
var highestScore = 0

var space_between_leaderboard_slots = 10
var space_between_columns = 40

var slot_position_x = 30
var slot_position_y = 60

var cameraSwitchCount = 0
var cameraSwitchIntervals = 4

var save_path = "user://variable.save"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("ui_select")):
		instructions_label.visible = false
	
	if(Input.is_action_pressed("ui_select")):
		timer += delta
		
		if (timer >= 1):
			timer = 0
			score += 1
			cameraSwitchCount += 1
			
			var newInstance = middle_block_tree.instantiate()
			target_node.add_child(newInstance)
			newInstance.global_position.x = 560
			newInstance.global_position.y = height
			height -= 127
			
			if(cameraSwitchCount == cameraSwitchIntervals):
				var posDiff = 127*4
				camera.position.y -= posDiff
				cameraSwitchCount = 0
			
		score_label.text = str("Your hair is ", score, " mm tall.")
			
	elif(Input.is_action_just_released("ui_select")):
		var newInstance = top_block_hair_brown.instantiate()
		target_node.add_child(newInstance)
		newInstance.global_position.x = 560
		newInstance.global_position.y = height
		set_process(false)
		end_message_label.visible = true
		end_message_label.text = str("Your hair has stopped its growth. \nIts final length is " , score, "mm")
		score_label.visible = false
		
		RecordScore()
		
		print("Highest score: ", highestScore)
		
		
func RecordScore():
	await Leaderboards.post_guest_score("waitingforyourgrowth-main-Txxd", score, "Erwan")
	
	var lol = await Leaderboards.get_player_scores("waitingforyourgrowth-main-Txxd")
	
	var index = 0;
	
	for entry in lol.scores:
		print(entry.score)
		var newInstance = leaderboard_slot.instantiate()
		
		newInstance.global_position.x = slot_position_x
		newInstance.global_position.y = slot_position_y
		slot_position_y += space_between_leaderboard_slots
		
		##change the columns
			
		
		
		
		
		
		
		
		
