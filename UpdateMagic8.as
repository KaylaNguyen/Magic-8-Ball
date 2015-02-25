/*** This file holds the Magic 8 Ball Screen and will update the textbox**/package{	import flash.display.*;	import flash.utils.Timer;//	import ihart.event.*;	import flash.events.*;	import flash.text.TextField;
	import flash.text.*;
	import flash.text.engine.TextBaseline;
	public class UpdateMagic8 extends MovieClip {
//		public static var CV_DELAY: int = 500; 
//		var cvTimer: Timer; 		// iHart
		var sayings : Array = new Array ("It is certain", "It is decidedly so", "Without a doubt", "Yes, definitely", "You may rely on it", "As I see it, yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy, try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful");		
		var s: String  = ""; 
		var output: TextField = new TextField();
//		private var cvManager: CVManager; 
//		private var port:uint = 5204; 
//		private var hostName:String = "localhost"; 
		
			public function UpdateMagic8() : void 
	{
		addChild(output); 
		output.x = 230; 
		output.y = 200; 
		output.textColor = 0xFF0000; 
		output.wordWrap = true; 

//		cvManager = new CVManager(hostName, port); 
//		cvManager.addEventListener(CVEvent.SHELL, getData); 
//		cvTimer = new Timer(CV_DELAY); 
//		cvTimer.addEventListener(TimerEvent.TIMER, allowCVEvents); 
	}
	
//	private function allowCVEvents(e: Event) : void 
//	{
//		cvEventsAllowed = true; 
//		cvTimer.stop(); 
//	}
////	public function getData(e: CVEvent):void{
//		cvEventsAllowed = false; 
//		cvTimer.start(); 
//		this.output.text = ballSpeaks(); 
//	}
	
	public function mouseClicked ( e : MouseEvent) :void 
	{
		trace("clicking..."); 
		trace(ballSpeaks()); 
	//	cvEventsAllowed = false;
	//	cvTimer.start(); 
		this.output.text = ballSpeaks();
	}
	
	public function ballSpeaks(): String
	{
		var r: int = Math.floor(Math.random() * sayings.length);
		return sayings[r];
	}
		}}