/*
	A generic Polygon class, with thanks to 
	Chen Yin Jie http://crr.ucc.ie/yinjiechen.html
*/

package com.mi {

	import flash.display.MovieClip;
	
	public class Polygon extends MovieClip {
		public static const REGPOLY = 1, DAVIDPOLY = 2, STARPOLY = 3, POINTS = 4, RADIUS = 5, CENTER = 6, POLYCIRCLE = 7;
		private var n, xO, yO, r;
		private var xA;
		private var yA;
		private var lw, color;

		public function Polygon(nSides = 0, sizes = 0, lwis = 1, coloris = 0X000000) {
			setPolygon(nSides, sizes, lwis, coloris);
		}
	
		public function setPolygon(nSide = 0, size = 0, lwi = 1, colori = 0X000000) {
			n = nSide;
			xO = 0;
			yO = 0;
			r = size/2;
			lw = lwi;
			color = colori;
			xA = new Array();
			yA = new Array();
			for (var i=0;i<n;i++) {
				xA[i] = (xO + r * Math.cos(2 * Math.PI * i / n));
				yA[i] = (yO + r * Math.sin(2 * Math.PI * i / n));
			}
		}
		
	public function drawPolygon(index, sec = 0) {
			graphics.clear();
			graphics.lineStyle(lw,color,1);
			switch (index) {
				case 1: drawRegPoly(this.graphics);
					break;
				case 2: drawDavidRegPoly(this.graphics);
					break;
				case 3: drawStarRegPoly(this.graphics);
					break;
				case 4: drawPoints(this.graphics);
					break;
				case 5: drawRadius(this.graphics, sec);
					break;
				case 6: drawCenter(this.graphics);
					break;
				case 7: drawPolyCircle(this.graphics);
					break;
			}
		}

		public function drawRegPoly(g) {
			for(var i = 0; i < n; i += 1) {
				g.moveTo(xA[i], yA[i]);
				g.lineTo(xA[(i + 1) % n], yA[(i + 1) % n]);
			}
		}
		
		public function drawDavidRegPoly(g) {
		for(var i = 0; i < n; i += 1) {
				g.moveTo(xA[i], yA[i]);
				g.lineTo(xA[(i + 2) % n], yA[(i + 2) % n]);
			}
		}
		
		public function drawStarRegPoly(g){
		for(var i = 0; i < n; i += 1) {
				g.moveTo(xA[i], yA[i]);
				g.lineTo(xA[(i + n/2) % n], yA[(i + n/2) % n]);
			}
		}
		
		public function drawPoints(g) {
		for(var i = 0; i < n; i += 1) {
				g.drawCircle(xA[i], yA[i], 1);
			}
		}
		
		public function drawRadius(g, s){
			g.moveTo(xO, yO);
			g.lineTo(xA[s], yA[s]);
		}
		
		public function drawCenter(g){
			g.drawCircle(xO, yO, 1);
		}
		
		public function drawPolyCircle(g){
			for(var i = 0; i < n; i += 1) {
				g.drawCircle(xA[i], yA[i], r);
			}
		}
	}
}
