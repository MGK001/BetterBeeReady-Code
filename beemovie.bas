2000 rem Calc pos
2020 if bp<hv or bp>hv+sz then print "error 3 ": return
2030 rw = int((bp-hv)/22):cl = bp-(hv+(rw*22))
2050 return
2060 rem sniff
2070 for i=0 to 7
2080 sd(i)=0
2090 if rw=0 and cl=0 and i=2 then sd(i)=cd(i)
2100 if rw=0 and (cl>0 and cl<21) and (i>=2 and i<=6) then sd(i)=cd(i)
2110 if (rw=0 and cl=21) and (i>=4 and i<=6) then sd(i)=cd(i)
2120 if (rw>0 and rw<22) and cl=0 and (i>=0 and i<=4) then sd(i)=cd(i)
2130 if (rw>0 and rw<22) and cl=21 and (i=0 or (i>=4 and i<=7)) then sd(i)=cd(i)
2140 if (rw=22 and cl=0) and (i>=0 and i<=2) then sd(i)=cd(i)
2150 if(rw=22and(cl>0andcl<21))and((i>=0 or i<=2)and(i=6 or i=7))thensd(i)=cd(i)
2160 if (rw=22 and cl=21) and (i=0 or i=6 or i=7) then sd(i)=cd(i)
2170 if (rw>0 and rw<22) and (cl>0 and cl<21) then sd(i)=cd(i)
2180 next i
2190 return
2200 rem Move
2210 for i=0 to 7
2220 if sd(i)<>0 then  pv=peek(bp+sd(i))
2230 if pv=hv then goto 2210
2240 fb=(pv=fi)
2250 if fb=-1 then bp=bp+sd(i)
2260 if fb=-1 goto 2280
2270 next i
2280 if bp<>lp then return
2282 rem look 5 
2285 if bp=lp then gosub 2650
2288 if tg<>0 then return
2290 rem rndm move
2300 if bp=lp then rd=int(rnd(0)*7)+1 : if sd(rd)=0 then goto 2300
2310 bp=bp+sd(rd):return
2320 rem compass
2330 for i=0 to 7:read cd(i):next
2340 data -22,-21,1,23,22,21,-1,-23
2350 return
2360 rem Draw Bee
2370 if bp=hv then goto 2410
2380 if lp<>hv then poke lp,32
2390 poke bp,bi
2400 poke ch+(bp-hv),bc
2410 lp=bp
2420 gosub 2000
2430 return
2440 REM fly to a target
2445 if fb=-1 then tg=hv
2450 if bp=tg then gosub 2620:return
2460 REM sniff
2470 gosub 2060
2480 REM Try move start NE
2490 for i=7 to 5 step -1
2500  bp=bp+abs((sd(i)<>0) and (PEEK(bp+sd(i))<>fi))*sd(i)
2510 if bp<>lp then goto 2580
2520 next i
2530 REM Try others
2540 for i=0 to 4
2550 bp=bp+abs((sd(i)<>0) and (PEEK(bp+sd(i))<>fi))*sd(i)
2560 if bp<>lp then goto 2580
2570 next i
2580 fb=(bp<>tg)
2590 REM Draw Bee
2600 gosub 2360
2610 goto 2440:return
2620 rem Tgt
2630 bp=tg : lp=0
2635 tg=0
2640 return
2650 REM Look
2660 tg=0:rd=int(rnd(0)*7)+1
2670 if sd(rd)=0 then goto 2660
2680 for i=bp to bp+(sd(rd)*5)
2690 pv=abs((i>hv) and (i<hv+sz))*peek(bp+i)
2700 if pv=fi then goto 2720
2710 next i
2720 tg=bp+i:return