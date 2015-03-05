Paddle paddle;
Ball ball;
ArrayList <RedBrick> redbricks;
ArrayList <OrangeBrick> orangebricks;
ArrayList <YellowBrick> yellowbricks;
ArrayList <GreenBrick> greenbricks;
ArrayList <BlueBrick> bluebricks;
ArrayList <IndigoBrick> indigobricks;
ArrayList <VioletBrick> violetbricks;
int score = 0;
boolean gameOver = false;
void setup()
{
	size(1000, 700);
	background(183, 222, 255);
	redbricks = new ArrayList <RedBrick>();
	orangebricks = new ArrayList <OrangeBrick>();
	yellowbricks = new ArrayList <YellowBrick>();
	greenbricks = new ArrayList <GreenBrick>();
	bluebricks = new ArrayList <BlueBrick>();
	indigobricks = new ArrayList <IndigoBrick>();
	violetbricks = new ArrayList <VioletBrick>();
	for(int i = 0; i < 13; i++)
	{
		redbricks.add(new RedBrick(i*77, 2));
		orangebricks.add(new OrangeBrick(i*77, 14));
		yellowbricks.add(new YellowBrick(i*77, 26));
		greenbricks.add(new GreenBrick(i*77, 38));
		bluebricks.add(new BlueBrick(i*77, 50));
		indigobricks.add(new IndigoBrick(i*77, 62));
		violetbricks.add(new VioletBrick(i*77, 74));
	}
	paddle = new Paddle();
	ball = new Ball((int)(Math.random() * 500) + 20, 300);
}
void draw()
{
	background(183, 222, 255);
	for(int i = 0; i < redbricks.size(); i++)
	{
		redbricks.get(i).show();
		if(get(ball.myX, ball.myY-11) == redbricks.get(i).myColor)
		{
			redbricks.remove(i);
			score+= 7;
			break;
		}
	}
	for(int i = 0; i < orangebricks.size(); i++)
	{
		orangebricks.get(i).show();
		if(get(ball.myX, ball.myY-11) == orangebricks.get(i).myColor)
		{
			orangebricks.remove(i);
			score+= 6;
			break;
		}
	}
	for(int i = 0; i < yellowbricks.size(); i++)
	{
		yellowbricks.get(i).show();
		if(get(ball.myX, ball.myY-11) == yellowbricks.get(i).myColor)
		{
			yellowbricks.remove(i);
			score+= 5;
			break;
		}
	}
	for(int i = 0; i < greenbricks.size(); i++)
	{
		greenbricks.get(i).show();
		if(get(ball.myX, ball.myY-11) == greenbricks.get(i).myColor)
		{
			greenbricks.remove(i);
			score+= 4;
			break;
		}
	}
	for(int i = 0; i < bluebricks.size(); i++)
	{
		bluebricks.get(i).show();
		if(get(ball.myX, ball.myY-11) == bluebricks.get(i).myColor)
		{
			bluebricks.remove(i);
			score+= 3;
			break;
		}
	}
	for(int i = 0; i < indigobricks.size(); i++)
	{
		indigobricks.get(i).show();
		if(get(ball.myX, ball.myY-11) == indigobricks.get(i).myColor)
		{
			indigobricks.remove(i);
			score+= 2;
			break;
		}
	}
	for(int i = 0; i < violetbricks.size(); i++)
	{
		violetbricks.get(i).show();
		if(get(ball.myX, ball.myY-11) == violetbricks.get(i).myColor)
		{
			violetbricks.remove(i);
			score++;
			break;
		}
	}
	paddle.show();
	if(get(ball.myX, ball.myY-11) == color(255, 50, 50) || get(ball.myX, ball.myY-11) == color(255, 132, 37) || get(ball.myX, ball.myY-11) == color(255, 250, 75) || get(ball.myX, ball.myY-11) == color(110, 155, 10) || get(ball.myX, ball.myY-11) == color(34, 138, 255) || get(ball.myX, ball.myY-11) == color(156, 80, 255) || get(ball.myX, ball.myY-11) == color(75, 0, 130) || get(ball.myX, ball.myY-11) == color(127, 0, 255))
		ball.down = true;
	if(ball.myY >= height)
		gameOver = true;
	if(redbricks.size() == 0 && orangebricks.size() == 0 && yellowbricks.size() == 0 && greenbricks.size() == 0 && bluebricks.size() == 0 && indigobricks.size() == 0 && violetbricks.size() == 0)
		gameOver = true;
	if(gameOver == false)
	{
		textSize(20);
		fill(255, 153, 204);
		text("Score: " + score, 5, 695);
		paddle.move();
		ball.show();
		ball.move();
	}
	else
	{
		textAlign(CENTER);
		textSize(50);
		fill(0);
		if(redbricks.size() == 0 && orangebricks.size() == 0 && yellowbricks.size() == 0 && greenbricks.size() == 0 && bluebricks.size() == 0 && indigobricks.size() == 0 && violetbricks.size() == 0)
			text("You Win!", width/2, height/2-50);
		else
			text("Game Over", width/2, height/2-50);
		textSize(60);
		text("Score: " + score, width/2, height/2+10);
	}
}
class Ball
{
	int myX, myY;
	boolean right, down;
	Ball(int x, int y)
	{
		myX = x;
		myY = y;
		right = true;
		down = true;
	}
	void show()
	{
		noStroke();
		fill(100);
		ellipse(myX, myY, 20, 20);
	}
	void move()
	{

		if(myX >= 990)
			right = false;
		if(myX <= 10)
			right = true;
		if(myY <= 10)
			down = true;
		if(get(myX, myY+10) == color(255, 255, 255))
			down = false;

		if(right)
			myX+= 5;
		else
			myX-= 5;
		if(down)
			myY+= 5;
		else
			myY-= 5;
	}
}
class Paddle
{
	int myX, myY;
	Paddle()
	{
		myX = 300;
		myY = 660;
	}
	void show()
	{
		noStroke();
		fill(255);
		rect(myX, myY, 100, 15, 10);
	}
	void move()
	{
		myX = mouseX - 50;
	}
}
class RedBrick extends Brick
{
	RedBrick(int x, int y)
	{
		myY = y;
		myX = x;
		myColor = color(255, 50, 50);
	}
}
class OrangeBrick extends Brick
{
	OrangeBrick(int x, int y)
	{
		myY = y;
		myX = x;
		myColor = color(255, 132, 37);
	}
}
class YellowBrick extends Brick
{
	YellowBrick(int x, int y)
	{
		myY = y;
		myX = x;
		myColor = color(255, 250, 75);
	}
}
class GreenBrick extends Brick
{
	GreenBrick(int x, int y)
	{
		myY = y;
		myX = x;
		myColor = color(110, 155, 10);
	}
}
class BlueBrick extends Brick
{
	BlueBrick(int x, int y)
	{
		myY = y;
		myX = x;
		myColor = color(34, 138, 255);
	}
}
class IndigoBrick extends Brick
{
	IndigoBrick(int x, int y)
	{
		myY = y;
		myX = x;
		myColor = color(75, 0, 130);
	}
}
class VioletBrick extends Brick
{
	VioletBrick(int x, int y)
	{
		myY = y;
		myX = x;
		myColor = color(127, 0, 255);
	}
}
abstract class Brick
{
	int myX, myY, myColor;
	void show()
	{
		noStroke();
		fill(myColor);
		rect(myX, myY, 75, 10);
	}
}