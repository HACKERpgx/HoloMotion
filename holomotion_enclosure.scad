// HoloMotion Gesture Controller enclosure, parametric OpenSCAD
// Print in PETG/PLA. Two-piece clamshell, nominal 120 x 72 x 28 mm.
$fn=64;
L=120; W=72; H=28; wall=2.4; r=8; lid_t=2.4;
module rounded_box(l,w,h,r){
  hull(){ for(x=[-l/2+r,l/2-r]) for(y=[-w/2+r,w/2-r]) translate([x,y,0]) cylinder(h=h,r=r); }
}
module shell(){ difference(){ rounded_box(L,W,H,r); translate([0,0,wall]) rounded_box(L-2*wall,W-2*wall,H,r-wall); } }
module boss(x,y){ translate([x,y,wall]) cylinder(h=H-wall-2,r=4.2); }
module base(){ difference(){ union(){ shell();
  // four internal M3 standoffs
  for(p=[[L/2-10,W/2-10],[-L/2+10,W/2-10],[L/2-10,-W/2+10],[-L/2+10,-W/2+10]]) boss(p[0],p[1]);
  }
  // USB-C opening at rear
  translate([-18,W/2-1,10]) cube([18,5,9],center=true);
  // audio jack opening at right side
  translate([L/2+1,0,12]) rotate([0,90,0]) cylinder(h=8,r=4.5,center=true);
  // status LED window
  translate([38,-W/2-1,19]) rotate([90,0,0]) cylinder(h=5,r=2.2);
  // M3 clearance holes through the bosses
  for(p=[[L/2-10,W/2-10],[-L/2+10,W/2-10],[L/2-10,-W/2+10],[-L/2+10,-W/2+10]]) translate([p[0],p[1],wall-0.1]) cylinder(h=H,r=1.7);
} }
module lid(){ difference(){ translate([0,0,H]) rounded_box(L,W,lid_t,r); 
  // central grip / diffuser recess
  translate([0,0,H+lid_t-0.8]) rounded_box(72,34,1.2,6);
  // four M3 clearance holes
  for(p=[[L/2-10,W/2-10],[-L/2+10,W/2-10],[L/2-10,-W/2+10],[-L/2+10,-W/2+10]]) translate([p[0],p[1],H-0.1]) cylinder(h=4,r=1.7);
} }
// Default view: base and lid separated for printing
translate([0,0,0]) base();
translate([0,0,38]) lid();
