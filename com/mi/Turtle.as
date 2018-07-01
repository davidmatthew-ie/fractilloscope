/* 
	This code is responsible for rendering the line, or 'turtle', so-called because
	it follows the 'turtle graphics' paradigm. With turtle graphics, the turtle has 
	three attributes: an orientation (or direction), a location, and a pen. The pen
	also has attributes: color, line-width, and on/off (or up/down press) state.
*/
package com.mi {

	public class Turtle {
			public static const PI = Math.PI;
			private var dir, pen, x, y, g, lw, color; 

		public function Turtle(canvas, cX=0, cY=0, dirIn=0, lineWidth=1, drawColor=0X000000) {
			x = cX;
			y = cY;
			dir = dirIn;
			pen = 1;
			g = canvas.graphics;
			lw = lineWidth;
			color = drawColor;
		}

		public function moveTo(pX,pY) {
			x = pX;
			y = pY;
		}

		public function up() {
			pen = 0;
		}

		public function down() {
			pen = 1;
		}

		public function left(angle) {
			dir += angle;
		}

		public function right(angle){
			dir -= angle;
		}

		public function setPen(lineWidth, drawColor) {
			lw = lineWidth;
			color = drawColor;
		}

		public function clearAll() {
			g.clear();
		}

		public function forward(d) {
			var x1, y1;
			g.lineStyle(lw, color, 1);
			x1 = x + d * Math.cos(dir * Math.PI / 180);
			y1 = y + d * Math.sin(dir * Math.PI / 180);
			if (pen == 1) {
				g.moveTo(x, y);
				g.lineTo(x1, y1);
			}
			x = x1;
			y = y1;
		}

		public function backward(d) {
			forward(-d);
		}
	}
}