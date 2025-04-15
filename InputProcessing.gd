extends Node

@export var score_label:Node
@export var instructions_label:Node
@export var target_node:Node
@export var middle_block_tree:PackedScene
@export var top_block_hair_brown:PackedScene

var score = 0
var timer = 1
var height = 430

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("ui_select")):
		timer += delta
		
		if (timer >= 1):
			timer = 0
			score += 1
			
			var newInstance = middle_block_tree.instantiate()
			target_node.add_child(newInstance)
			newInstance.global_position.x = 560
			newInstance.global_position.y = height
			height -= 127
			
			##Insert pixel art instantiation
			##Move camera n shit
			
		score_label.text = str("Your hair is ", score, " mm tall.")
		
		if(score >= 1):
			instructions_label.visible = false
			
	elif(Input.is_action_just_released("ui_select")):
		var newInstance = top_block_hair_brown.instantiate()
		target_node.add_child(newInstance)
		newInstance.global_position.x = 560
		newInstance.global_position.y = height
		set_process(false)
		print("Game Over")
		
		
		
		
		
		
		
		
		
		
		
		
