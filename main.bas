10 rem Better Bee Ready
11 rem Save memory for icons
12 poke 52,28: poke 56,28: clr
13 gosub 200 
15 dim sd(7)
18 dim cd(7)
20 let hv = 7680
30 let bh = 3
40 let fc = 4
50 let fi = 2
60 let hc = 2 : let bc=7
70 let ch = 38400
80 let sz=505
90 let bp = 7681 : let lp=bp
100 let bi=0
117 rem Compass Directions
118 gosub 240 : gosub 540
120 print chr$(147)
125 rem Draw Hive
130 gosub 1000
131 rem Draw Flowers
140 gosub 1050
143 rem Calculate position of bee
145 gosub 310
146 rem Bee Sniff
147 gosub 360
148 rem Draw Bee
149 gosub 600
150 get a$: if a$="" then goto 143
160 print chr$(147)
165 poke 36869,240
170 end
200 rem copy the chr set
210 for i=7168 TO 7679: poke i,peek(i+25600): next
230 return
240 rem set up the characters
250 for i=0 to 31:read z:poke 7168+i,z:next:poke 36869,255
252 return
260 data 8,28,28,99,127,34,62,8
265 data 195,255,90,126,102,90,60,0
270 data 8,28,42,119,42,8,8,28
275 data 0,24,60,102,66,126,66,90