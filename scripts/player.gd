extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var pointOrig=Vector2(0,0)
var jumpPoint=Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pointOrig=self.position
	jumpPoint=Vector2(self.position.x,self.position.y-200)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().gameOver:
		print("gameover")
	else:	
		if Input.is_action_pressed("jump"):
			$Tween.start()
			$Tween.interpolate_property(self, "position",
			pointOrig, jumpPoint, 0.5,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$PlayerSprite.play("jump")
			yield($Tween,"tween_completed")
			$Tween.interpolate_property(self, "position",
			 jumpPoint,pointOrig, 0.5,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			yield($Tween,"tween_completed")
			$PlayerSprite.play("run")


func _on_Player_body_entered(body):	
	get_parent().updateScore()
	if get_parent().gameOver == true:
		body.sleeping=true
	if (str(body.name).find("mashroom"))!= -1:
		body.eaten()
	else:
		get_parent().stopMoving()
		$PlayerSprite.play("die")
		yield($PlayerSprite,"animation_finished")
		$PlayerSprite.playing=false
		self.visible=false
		get_parent().get_node("HUD").visible=true
		
		#print(body.name)	
			#body.queue_free()
