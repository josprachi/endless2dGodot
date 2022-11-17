extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var tex1= preload("res://Assets/images/plot/Object/Tree_1.png")
var tex2 =preload("res://Assets/images/plot/Object/Crate.png")
var rng= RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var num= rng.randi_range(0,1)
	if num==0:
		$Sprite.texture=tex1
	else:
		$Sprite.texture=tex2	
	#self.linear_velocity =Vector2(-100,0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().gameOver:
		queue_free()
#	pass
