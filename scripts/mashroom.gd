extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func eaten():
	$Sprite.visible=false
	$Particles2D.visible=true
	$lifeTimer.start()
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.linear_velocity +=Vector2(-1,0)
#	pass


func _on_lifeTimer_timeout():
	queue_free()
	pass # Replace with function body.
