extends Node2D
export (PackedScene) var mashroom


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score =0
# Called when the node enters the scene tree for the first time.
func _ready():
	score=0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func updateScore():
	score += 1
	$ScoreLabel.text= "Score : "+str(score)
	pass
func _on_Timer_timeout():
	
	var mashroom_ = mashroom.instance()
	mashroom_.position=Vector2(1100,450)
	add_child(mashroom_)
	pass # Replace with function body.
