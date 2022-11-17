extends Node2D
export (PackedScene) var mashroom
export (PackedScene) var obstacle

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gameOver=true
var score =0
# Called when the node enters the scene tree for the first time.
func _ready():
	score=0
	gameOver=true
	#$AudioStreamPlayer2D.play()
	$Player/PlayerSprite.playing=false
	$Enemy.playing=false
	$Player.visible=false
	$Enemy.visible=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func updateScore():
	score += 1
	$ScoreLabel.text= "Score : "+str(score)
	pass
	
func startGame():
	gameOver=false
	score=0
	$AudioStreamPlayer2D.play()
	$Player/PlayerSprite.playing=true
	$Enemy.playing=true
	$Player.visible=true
	$Player/PlayerSprite.play("run")
	$Enemy.visible=true
	$Timer.start()
	$HUD.visible=false
	pass	
func stopMoving():
	gameOver=true
	$AudioStreamPlayer2D.stop()
	$Enemy.stopPlaying()
	$Enemy.visible=false
	#$Player.visible=false
	pass	
func _on_Timer_timeout():
	if  gameOver== false:
		var velocity= Vector2(-1024,0)
		var mashroom_ = mashroom.instance()
		mashroom_.linear_velocity= velocity
		mashroom_.position=Vector2(1100,450)
		add_child(mashroom_)
		
		var obstacle_ = obstacle.instance()
		obstacle_.position=Vector2(1600,450)
		obstacle_.linear_velocity= velocity
		add_child(obstacle_)
	
