/* 
	This code contains the main fractal algorithms. Spider, 
	Wicker Star and Wheel Web are my own creations, whereas 
	the seven others are based on well-known fractal algorithms.
*/

package fractals
{
	import com.Turtle;
	import fl.events.ComponentEvent;
	import fl.events.SliderEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	 
	public dynamic class MainTimeline extends MovieClip {
		
		public var figureNames, btSpy, cX, cY, canvas, i, t;
		public var sliderPanel:MovieClip;
		public var controlPanel:MovieClip;
		public var info:TextField;
		public var screen:MovieClip;
		public const PI = 3.141592653589793;
		
		public function MainTimeline() {
			super();
			addFrameScript(0, frame1);
		}
	
		public function onEnter(param1:ComponentEvent) {
			paint();
		}

		public function spider(param1, param2, param3) {
			if(param2 < 2 || param1 == 0) {
				return;
			}
			t.forward(param2 / 2);
			t.left(param3 * 2);
			spider(param1 - 1, param2, param3);
			t.right(param3);
			spider(param1 - 1, param2 / 2, param3);
			t.right(param3);
			spider(param1 - 1, param2 / 2, param3);
			t.right(param3);
			spider(param1 - 1, param2 / 2, param3);
			t.right(param3);
			spider(param1 - 1, param2, param3);
			t.left(param3 * 2);
			spider(param1 - 1, param2 / 2, param3);
			t.backward(param2 / 2);
		}

		public function wickerStar(param1, param2, param3) {
			if(param2 < 2 || param1 == 0) {
				return;
			}
			t.right(param3);
			t.forward(param2);
			t.right(param3 * 3);
			t.forward(param2);
			wickerStar(param1 - 1, param2 * 0.99, param3);
			t.backward(param2);
			t.left(param3 * 3);
			t.backward(param2);
			t.left(param3);
		}

		public function wheelWeb(param1, param2, param3) {
			if(param2 < 2 || param1 == 0) {
				return;
			}
			t.left(90);
			t.forward(param2 * 0.8);
			wheelWeb(param1 - 1, param2, param3);
			t.left(param3 * 2);
			wheelWeb(param1 - 1, param2, param3);
			t.right(param3 * 2);
			t.backward(param2 * 0.8);
			t.right(90);
		}
		
		public function fern(param1, param2, param3, param4, param5) {
			if(param1 == 0 || param2 < 2) {
				return;
			}
			t.forward(2 * param2 / 3);
			t.left(param3);
			fern(param1 - 1, param2 / 2, param3, param4, param5);
			t.right(param3);
			t.forward(2 * param2 / 3);
			t.right(param4);
			fern(param1 - 1, param2 / 2, param3, param4, param5);
			t.left(param4);
			t.forward(2 * param2 / 3);
			t.left(param5);
			fern(param1 - 1, 0.8 * param2, param3, param4, param5);
			t.right(param5);
			t.backward(2 * param2);
		}
		
		public function quadTree(param1, param2, param3) {
			if(param2 < 2 || param1 == 0) {
				return;
			}
			t.forward(param2);
			t.left(param3 * 1.5);
			quadTree(param1 - 1, param2 / 2, param3);
			t.right(param3);
			quadTree(param1 - 1, param2 / 2, param3);
			t.right(param3);
			quadTree(param1 - 1, param2 / 2, param3);
			t.right(param3);
			quadTree(param1 - 1, param2 / 2, param3);
			t.left(param3 * 1.5);
			t.backward(param2);
		}
		
		public function c(param1, param2) {
			if(param1 == 0 || param2 < 2) {
				t.forward(param2);
				return;
			}
			c(param1 - 1, param2);
			t.right(90);
			c(param1 - 1, param2);
			t.left(90);
		}
		
		public function s(param1, param2) {
			var _loc3_ = param2 / Math.sqrt(2);
			if(param1 == 0) {
				return;
			}
			s(param1 - 1, param2);
			t.right(45);
			t.forward(_loc3_);
			t.right(45);
			s(param1 - 1, param2);
			t.left(90);
			t.forward(param2);
			t.left(90);
			s(param1 - 1, param2);
			t.right(45);
			t.forward(_loc3_);
			t.right(45);
			s(param1 - 1, param2);
		}
		
		public function flake(param1, param2) {
			var _loc3_ = 0;
			while(_loc3_ < 3) {
				k(param1, param2);
				t.right(120);
				_loc3_++;
			}
		}
		
		public function antiflake(param1, param2) {
			var _loc3_ = 0;
			while(_loc3_ < 3) {
				k(param1, param2);
				t.left(120);
				_loc3_++;
			}
		}
		
		public function dragon(param1, param2, param3) {
			if(param2 == 0) { 
				t.forward(param3);
				return;
			}
			var _loc4_ = param3 / Math.sqrt(2);
			t.right(param1 * 45);
			dragon(1, param2 - 1, _loc4_);
			t.left(param1 * 90);
			dragon(-1, param2 - 1, _loc4_);
			t.right(param1 * 45);
		}
		
		public function square(param1, param2) {
			var _loc3_ = param2 / Math.sqrt(2);
			if(param1 == 0) {
				return;
			}
			var _loc4_ = 0;
			while(_loc4_ < 4) {
				s(param1, param2);
				t.right(45);
				t.forward(_loc3_);
				t.right(45);
				_loc4_++;
			}
		}
		
		public function tree(param1, param2, param3) {
			if(param2 < 2 || param1 == 0) {
				return;
			}
			t.forward(param2);
			t.left(param3);
			tree(param1 - 1, param2 / 2, param3);
			t.right(param3 * 2);
			tree(param1 - 1, param2 / 2, param3);
			t.left(param3);
			t.backward(param2);
		}
		
		public function k(param1, param2) {
			if(param1 == 1 || param2 < 2) {
				t.forward(param2);
				return;
			}
			k(param1 - 1, param2 / 3);
			t.left(60);
			k(param1 - 1, param2 / 3);
			t.right(120);
			k(param1 - 1, param2 / 3);
			t.left(60);
			k(param1 - 1, param2 / 3);
		}
		
		public function selectClick(param1:MouseEvent) {
			switch(controlPanel.figureList.selectedIndex) {
			case 0:
				sliderPanel.visible = true;
				sliderPanel.slider1.visible = true;
				sliderPanel.sliderName1.visible = true;
				sliderPanel.sliderName1.text = "Angle";
				sliderPanel.slider1.value = 47;
				sliderPanel.s1Val.text = "" + sliderPanel.slider1.value;
				sliderPanel.slider2.visible = false;
				sliderPanel.sliderName2.visible = false;
				sliderPanel.s2Val.visible = false;
				sliderPanel.slider3.visible = false;
				sliderPanel.sliderName3.visible = false;
				sliderPanel.s3Val.visible = false;
				controlPanel.orderTF.text = 6;
				controlPanel.lengthTF.text = 220;
				info.text = "My Spider Fractal \n\nRecommended settings:\n\nAngle: 47°\nOrder: 6\nLine Length: 220";
				break;
			case 1:
				sliderPanel.visible = true;
				sliderPanel.slider1.visible = true;
				sliderPanel.sliderName1.visible = true;
				sliderPanel.sliderName1.text = "Angle";
				sliderPanel.slider1.value = 36;
				sliderPanel.slider2.visible = false;
				sliderPanel.sliderName2.visible = false;
				sliderPanel.s2Val.visible = false;
				sliderPanel.slider3.visible = false;
				sliderPanel.sliderName3.visible = false;
				sliderPanel.s3Val.visible = false;
				controlPanel.orderTF.text = 200;
				controlPanel.lengthTF.text = 200;
				info.text = "My Wicker Star Fractal \n\nRecommended settings:\n\nAngle: several produce interesting results (e.g. 26°, 36°, 40°, 46°, 50°)\nOrder: 200\nLine Length: 200";
				break;
			case 2:
				sliderPanel.visible = true;
				sliderPanel.slider1.visible = true;
				sliderPanel.sliderName1.visible = true;
				sliderPanel.sliderName1.text = "Angle";
				sliderPanel.slider1.value = 30;
				sliderPanel.s1Val.text = "" + sliderPanel.slider1.value;
				sliderPanel.slider2.visible = false;
				sliderPanel.sliderName2.visible = false;
				sliderPanel.s2Val.visible = false;
				sliderPanel.slider3.visible = false;
				sliderPanel.sliderName3.visible = false;
				sliderPanel.s3Val.visible = false;
				controlPanel.orderTF.text = 11;
				controlPanel.lengthTF.text = 350;
				info.text = "My Wheel Web \n\nRecommended settings:\n\nAngle: 30°\nOrder: 11\nLine Length: 350";
				break;
			case 3:
				sliderPanel.visible = true;
				sliderPanel.slider1.visible = true;
				sliderPanel.sliderName1.visible = true;
				sliderPanel.sliderName1.text = "Angle";
				sliderPanel.slider1.value = 60;
				sliderPanel.s1Val.text = "" + sliderPanel.slider1.value;
				sliderPanel.slider2.visible = false;
				sliderPanel.sliderName2.visible = false;
				sliderPanel.s2Val.visible = false;
				sliderPanel.slider3.visible = false;
				sliderPanel.sliderName3.visible = false;
				sliderPanel.s3Val.visible = false;
				controlPanel.orderTF.text = 6;
				controlPanel.lengthTF.text = 200;
				info.text = "The Binary Tree\n\nDefined recursively by symmetric binary branching.";
				break;
			case 4:
				sliderPanel.visible = true;
				sliderPanel.slider1.visible = true;
				sliderPanel.sliderName1.visible = true;
				sliderPanel.sliderName1.text = "Angle";
				sliderPanel.slider1.value = 45;
				sliderPanel.s1Val.text = "" + sliderPanel.slider1.value;
				sliderPanel.slider2.visible = false;
				sliderPanel.sliderName2.visible = false;
				sliderPanel.s2Val.visible = false;
				sliderPanel.slider3.visible = false;
				sliderPanel.sliderName3.visible = false;
				sliderPanel.s3Val.visible = false;
				controlPanel.orderTF.text = 6;
				controlPanel.lengthTF.text = 200;
				info.text = "The Dandelion, also known as the quad tree.\n\nWorks recursively in a similar manner to the Binary tree, but with more branches.";
				break;
			case 5:
				sliderPanel.visible = true;
				sliderPanel.slider1.visible = true;
				sliderPanel.sliderName1.visible = true;
				sliderPanel.sliderName1.text = "Angle 1";
				sliderPanel.s1Val.text = "" + sliderPanel.slider1.value;
				sliderPanel.slider2.visible = true;
				sliderPanel.sliderName2.visible = true;
				sliderPanel.sliderName2.text = "Angle 2";
				sliderPanel.s2Val.visible = true;
				sliderPanel.s2Val.text = "" + sliderPanel.slider2.value;
				sliderPanel.slider3.visible = true;
				sliderPanel.sliderName3.visible = true;
				sliderPanel.sliderName3.text = "Angle 3";
				sliderPanel.s3Val.visible = true;
				sliderPanel.s3Val.text = "" + sliderPanel.slider3.value;
				controlPanel.orderTF.text = 7;
				controlPanel.lengthTF.text = 150;
				info.text = "The Fern Tree\n\nA natural-looking asymmetrical fractal.\n\nAll three sliders can be adjusted independently.";
				break;
			case 6:
				sliderPanel.visible = false;
				info.text = "The Koch snowflake\n\nAn exceedingly impressive fractal, this is one of the earliest fractal curves to have been described.";
				break;
			case 7:
				sliderPanel.visible = false;
				info.text = "The Anti-flake\n\nThis is a variation of the Koch snowflake, and is differentiated by just one single turn (a left one rather than a right one).";
				break;
			case 8:
				sliderPanel.visible = false;
				controlPanel.lengthTF.text = 5;
				info.text = "The C-Curve\n\nThe standard C curve is built using 45° isosceles triangles.\n\nIt is a special case of a period-doubling curve.";
				break;
			case 9:
				sliderPanel.visible = false;
				controlPanel.orderTF.text = 9;
				controlPanel.lengthTF.text = 10;
				info.text = "The Sierpinski Fractal\n\nAlso called the Sierpinski gasket/sieve, this is a fractal and attractive fixed set with the overall shape of an equilateral triangle, subdivided recursively into smaller equilateral triangles.";
				break;
			case 10:
				sliderPanel.visible = false;
				controlPanel.orderTF.text = 14;
				controlPanel.lengthTF.text = 290;
				info.text = "The Dragon Fractal\n\nA dragon curve is any member of a family of self-similar fractal curves, which can be approximated by recursive methods such as Lindenmayer systems.";
			}
		}

		public function onc(param1:Event) {
			paint();
		}
		
		public function paint() {
			t.clearAll();
			switch(btSpy) {
			case 0:
				t.moveTo(390,170);
				t.setPen(controlPanel.lineWidth.value,controlPanel.colorSelecter.selectedColor);
				spider(Number(controlPanel.orderTF.text),Number(controlPanel.lengthTF.text),Number(sliderPanel.slider1.value));
				break;
			case 1:
				t.moveTo(250,280);
				t.setPen(controlPanel.lineWidth.value,controlPanel.colorSelecter.selectedColor);
				wickerStar(Number(controlPanel.orderTF.text),Number(controlPanel.lengthTF.text),Number(sliderPanel.slider1.value));
				break;
			case 2:
				t.moveTo(490,250);
				t.setPen(controlPanel.lineWidth.value,controlPanel.colorSelecter.selectedColor);
				wheelWeb(Number(controlPanel.orderTF.text),Number(controlPanel.lengthTF.text),Number(sliderPanel.slider1.value));
				break;
			case 3:
				t.moveTo(390,0);
				t.setPen(controlPanel.lineWidth.value,controlPanel.colorSelecter.selectedColor);
				tree(Number(controlPanel.orderTF.text),Number(controlPanel.lengthTF.text),Number(sliderPanel.slider1.value));
				break;
			case 4:
				t.moveTo(390,0);
				t.setPen(controlPanel.lineWidth.value,controlPanel.colorSelecter.selectedColor);
				quadTree(Number(controlPanel.orderTF.text),Number(controlPanel.lengthTF.text),Number(sliderPanel.slider1.value));
				break;
			case 5:
				t.moveTo(390,0);
				t.setPen(controlPanel.lineWidth.value,controlPanel.colorSelecter.selectedColor);
				fern(Number(controlPanel.orderTF.text),Number(controlPanel.lengthTF.text),Number(sliderPanel.slider1.value),Number(sliderPanel.slider2.value),Number(sliderPanel.slider3.value));
				break;
			case 6:
				t.moveTo(320,50);
				t.setPen(controlPanel.lineWidth.value,controlPanel.colorSelecter.selectedColor);
				flake(Number(controlPanel.orderTF.text),Number(controlPanel.lengthTF.text));
				break;
			case 7:
				t.moveTo(320,50);
				t.setPen(controlPanel.lineWidth.value,controlPanel.colorSelecter.selectedColor);
				antiflake(Number(controlPanel.orderTF.text),Number(controlPanel.lengthTF.text));
				break;
			case 8:
				t.moveTo(390,100);
				t.setPen(controlPanel.lineWidth.value,controlPanel.colorSelecter.selectedColor);
				c(Number(controlPanel.orderTF.text),Number(controlPanel.lengthTF.text));
				break;
			case 9:
				t.moveTo(10,0);
				t.setPen(controlPanel.lineWidth.value,controlPanel.colorSelecter.selectedColor);
				square(Number(controlPanel.orderTF.text),Number(controlPanel.lengthTF.text));
				break;
			case 10:
				t.moveTo(390,100);
				t.setPen(controlPanel.lineWidth.value,controlPanel.colorSelecter.selectedColor);
				dragon(1,Number(controlPanel.orderTF.text),Number(controlPanel.lengthTF.text));
			}
		}
		
		public function s2Change(param1:SliderEvent) : void {
			sliderPanel.s2Val.text = "" + param1.value;
		}
		
		public function s1Change(param1:SliderEvent) : void {
			sliderPanel.s1Val.text = "" + param1.value;
		}
		
		public function onClick0(param1:MouseEvent) {
			btSpy = controlPanel.figureList.selectedIndex;
			paint();
		}
		
		public function s3Change(param1:SliderEvent) : void {
			sliderPanel.s3Val.text = "" + param1.value;
		}
		
		public function frame1() {
			cX = 0;
			cY = 0;
			btSpy = 0;
			canvas = new MovieClip();
			screen.addChild(canvas);
			t = new Turtle(canvas);
			t.left(90);
			figureNames = ["Spider", "Wicker Star", "Wheel Web", "Tree", "Dandelion", "Fern", "Flake", "Anti-Flake", "C-Curve", "Sierpinski", "Dragon"];
			i = 0;
			while(i < figureNames.length) {
				controlPanel.figureList.addItem({
					"label":figureNames[i],
					"value":i
				});
				i = i + 1;
			}
			controlPanel.figureList.addEventListener(MouseEvent.CLICK,selectClick);
			sliderPanel.slider1.addEventListener(SliderEvent.CHANGE,s1Change);
			sliderPanel.slider2.addEventListener(SliderEvent.CHANGE,s2Change);
			sliderPanel.slider3.addEventListener(SliderEvent.CHANGE,s3Change);
			controlPanel.draw_b0.addEventListener(MouseEvent.CLICK,onClick0);
			controlPanel.lineWidth.addEventListener(Event.CHANGE,onc);
			controlPanel.colorSelecter.addEventListener(Event.CHANGE,onc);
			controlPanel.orderTF.addEventListener(ComponentEvent.ENTER,onEnter);
			controlPanel.lengthTF.addEventListener(ComponentEvent.ENTER,onEnter);
		}
	}
}
