/**
* This file holds the Magic 8 Ball Screen and will update the textbox
**/
package{
	import flash.display.*;
	import flash.utils.Timer;
	import ihart.event.*;
	import flash.events.*;
	import flash.text.TextField;
	import flash.text.*;
	import flash.text.engine.TextBaseline;

	public class UpdateMagic8 extends MovieClip {
		public static var CV_DELAY: int = 1000; 
		var cvTimer: Timer; 
		// iHart
		var sayings : Array = new Array ("It is certain", "It is decidedly so", "Without a doubt", "Yes, definitely", "You may rely on it", "As I see it, yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy, try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful");		
		var s: String  = ""; 
		var output: TextField = new TextField();
		private var cvManager: CVManager; 
		private var port:uint = 5204; 
		private var hostName:String = "localhost"; 
		private var cvEventsAllowed: Boolean; 
		private var timerTicks: int; 
		
	public function UpdateMagic8() : void 
	{
		//initialize textfield
		addChild(output); 
		output.x = 230; 
		output.y = 200; 
		output.textColor = 0xFF0000; 
		output.wordWrap = true; 
		this.output.text = "Ask!"; //initial placeholder text
		
		//cvManager
		cvManager = new CVManager(hostName, port); 
		cvManager.addEventListener(CVEvent.SHELL, getData); 

		//initialize variables needed for the timer
		cvEventsAllowed = true;
		timerTicks = 0; 
		setupTimer();

	}
	
	private function setupTimer(): void
	{
		cvTimer = new Timer(1000, 1); 
		cvTimer.addEventListener(TimerEvent.TIMER, allowCVEvents); 
		cvTimer.start();
		s = ballSpeaks();
	}
	
	private function allowCVEvents(e: Event) : void 
	{
		trace(timerTicks + " Timer Ticks"); 
		timerTicks++; 
	//	cvTimer.stop(); 
	}
	
	//esentially the same as the mouse clicked fn. 
	public function getData(e: CVEvent):void{
		cvTimer.start();
		//once movement is spotted
		trace(timerTicks + " ticks");
		
		if(timerTicks > 1 && timerTicks < 3)
		{
			this.output.text = "Searching..."; 
		}
		else if(timerTicks >= 3 && timerTicks < 5)
		{
			this.output.text = "Shake Harder!";
		}
		else if(timerTicks >= 5 && timerTicks < 8)
		{
			this.output.text = s; 
			resetTimer();
		}
		else if(timerTicks >= 8)
		{
			resetTimer();
		}
	}
	
/*	public function mouseClicked ( e : MouseEvent) :void 
	{
		trace(ballSpeaks()); 
		//cvTimer.start(); 
		this.output.text = ballSpeaks();
	}*/
	
	public function ballSpeaks(): String
	{
		var r: int = Math.floor(Math.random() * sayings.length);
		return sayings[r];
	}
	
	
	public function resetTimer():void
	{
		cvTimer.stop();
		timerTicks = 0;
		setupTimer(); 
	}
}
}