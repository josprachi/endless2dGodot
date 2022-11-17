extends AnimatedSprite


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

func stopPlaying():
	playing=false
	$Particles2D.emitting=false
	$Particles2D2.emitting=false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().gameOver== false:
		if Input.is_action_pressed("jump"):
			$Tween.start()
			$Tween.interpolate_property(self, "position",
			pointOrig, jumpPoint, 0.5,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			play("jump")
			yield($Tween,"tween_completed")
			$Tween.interpolate_property(self, "position",
			 jumpPoint,pointOrig, 0.5,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			yield($Tween,"tween_completed")
			self.play("default")
		#if self.playing ==false:
			#self.play("default")
#	pass
