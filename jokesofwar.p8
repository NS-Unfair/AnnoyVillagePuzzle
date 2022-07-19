pico-8 cartridge // http://www.pico-8.com
version 30
__lua__
--blocks of war
--by aunfair
se=0
cartdata('bowsdc')
if dget(0)<=0then
 dset(0,1)
end
// 3 - gameplay
// 0 - other
sx,sy,sc,scspd=0,0,7,0.3
sca={7,1}
eca={14,2}
t=0
winner="???"
turn=1
ex,ey=-1,-1
anitile={}
state="menu"
pstat="menu"
version="ver. 1000.0.0"
inf={}
dll=26
sdl=1
camhack=false
maphack=false
cheats=false
inf[0]={name="shy red-eyed staller",disc="he's a little shy, he trys to stay off-screen away from the player. still don't like his red eyes tho."}
inf[1]={name="peaceful villager",disc="he's very happy to be back to normal, he's not fighting anymore. nothing could make him angry again..."}
inf[4]={name="villager",disc="he's havin' a great life! he's hangin' out with his children, and having lots of fun!"}
inf[2]={name="annoyed punkin' villager",disc=[[he hates that loud noise the noisy villagers are making. they yell every day and night. nobody can get any sleep!]]}
inf[3]={name="noisy villager",disc=[[they are very annoying, he has a voice so booming, it wakes everyone up! the punkin' villagers can't take it anymore!]]}
inf[7]={name="careless staller",disc=[[he hears, "they're very annoying, help use quiet em' down!" "yawn. i really don't care," he responds. "let's cause some chaos!" the chaos villagers say. "yawn. go away, i just want to stand here in everyone's way," he responds. he's very boring.]]}
inf[5]={name="chaos villager",disc=[[and oh boy, is she annoying. she wakes up villagers at 1 a.m. and blames it on the noisy villagers when they had nothing to do with it. she blames others for knocking over pots, when she did it. and somehow, she gets away with it every time. no wonder the noisy villager's info is "incorrect!"]]}
inf[9]={name="chaos villager",disc=[[aw man! you found me!]]}
inf[6]={name="conversion",disc=[[you expected it to crash, didn't you? nope! this guy used to be the exploding villager, he was yellow. yes this tile has a name, it's conversion. never knew that, didn't ya. maybe you did...]]}
inf[8]={name="crash",disc=[[uh oh, he it comes. wait for it... anytime now... and... crash! nothing happened. did you think i wouldn't patch that?]]}
inf[24]={name="cranky staller",disc=[[he's gotten bored stalling everyone overtime. but he still goes, stalling everyone. don't like his red eyes tho...]]}
inf[12]={name="explody bomb",disc=[[chao's latest invention... the bomb!]]}
inf[32]={name="empty space",disc=[[if you find this block, please report this to dev!]]}
hard="e4"
dif=hard
levels={}

function h1() -- cheats
 if maphack!=true then
 	menuitem(2,"maphack: true",h1)
 	maphack=true
 else
  menuitem(2,"maphack: false",h1)
  maphack=false
 end
 return 0
end
function h2()
 if camhack!=true then
 	menuitem(3,"freecam: true",h2)
 	camhack=true
 else
  menuitem(3,"freecam: false",h2)
  camhack=false
 end
 return 0
end
if cheats==true then
	menuitem(2,"maphack: false",h1)
	menuitem(3,"freecam: false",h2)
end
function trans()-- transits to any
 t=0
 cls(13)
 	 flip()
 	 cls(1)
 	 flip()
 	 cls(0)
 	 flip()
end
function quitlevel() -- quit
	if state!="menu"then
 state="menu"
 sfx(2)
 trans()
 end
 yelneb=false
end 
menuitem(1,"exit to menu",quitlevel)
levels[1]={name="noisy neighbors",l=4,lx=9,ly=0}
levels[3]={name="circle of noise",l=6,lx=25,ly=0}
levels[4]={name="it's on a timer",l=7,lx=33,ly=0}
levels[5]={name="noisy suprise",l=11,lx=41,ly=0}
levels[2]={name="ring of chaos",l=19,lx=49,ly=0}
levels[6]={name="outside the box",l=1,lx=17,ly=0}
levels[7]={name="snakey path",l=18,lx=57,ly=0}
levels[8]={name="invisible ninja",l=9,lx=65,ly=0}
levels[9]={name="minefield",l=9,lx=73,ly=0}
levels[10]={name="boom! stallers!",l=9,lx=81,ly=0}
levels[11]={name="arena of doom",l=13,lx=89,ly=0}
levels[12]={name="inside the box",l=12,lx=97,ly=0}
levels[13]={port=true,name="see the past",l=13,lx=105,ly=0}
levels[14]={alt=true,name="alternate dimension",l=11,lx=120,ly=0}
levels[15]={alt=true,name="the end is the start",l=4,lx=113,ly=0}
levels[16]={alt=true,name="indestructable",l=0,lx=0,ly=9}
levels[17]={alt=true,name="activate when ready",l=0,lx=8,ly=8}
levels[18]={alt=true,name="setting it off",l=12,lx=16,ly=8}
levels[19]={alt=true,name="lines of blockage",l=12,lx=24,ly=8}
levels[19]={port=true,alt=true,name="the box of magic",l=13,lx=32,ly=8}
levels[20]={name="it gets harder",l=13,lx=40,ly=8}
//levels[21]={imo=true,port=true,name="immortal's challenge",l=14,lx=49,ly=9}
yelneb=false
blocks={}
blocks[0]={4,4,4,4,1,4,8,8}
blocks[1]={8,12,12,8,8,8,0,0}
blocks[2]={1,12,12,1,1,1}
function genendless()
 for o1 = 49,56do
 for o2 = 9,16do
 mset(o1,o2,32)
 end
 end
 for o1 = 49,56do
 for o2 = 9,16do
 if mget(o1,o2) == 32 then
 bks=blocks[0]
 selb=bks[flr(rnd(#bks))]
 mset(o1,o2,selb)
 if selb == 4 then
  mset(o1+1,o2,4)
  mset(o1-1,o2,4)
  mset(o1,o2+1,4)
  mset(o1,o2-1,4)
 elseif selb == 8 then
  bks=blocks[1]
  mset(o1+1,o2,bks[flr(rnd(#bks))])
  mset(o1-1,o2,bks[flr(rnd(#bks))])
  mset(o1,o2+1,bks[flr(rnd(#bks))])
  mset(o1,o2-1,bks[flr(rnd(#bks))])
 elseif selb == 1 then
  bks=blocks[2]
  mset(o1+1,o2,bks[flr(rnd(#bks))])
  mset(o1-1,o2,bks[flr(rnd(#bks))])
  mset(o1,o2+1,bks[flr(rnd(#bks))])
  mset(o1,o2-1,bks[flr(rnd(#bks))])
 end
 end
 end
 end
end

function dis(aa,bb,cc,dd) -- distance
 local dx=0
 local dy=0
	if aa > cc then
	 dx=aa-cc
	else
	 dx=cc-aa
	end
	if bb > dd then
	 dy=bb-dd
	else
	 dy=dd-bb
	end
 return dx+dy
end

function neycount(a,b)
 local neb=0
 // get the count of captured
 // tiles around a:x,b:y.
 if mget(a,b+1)!=4then neb+=1end
 if mget(a,b-1)!=4then neb+=1end
 if mget(a-1,b)!=4then neb+=1end
 if mget(a+1,b)!=4then neb+=1end
 //if mget(a,b+1)==5then neb=0end
 //if mget(a,b-1)==5then neb=0end
 //if mget(a-1,b)==5then neb=0end
 //if mget(a+1,b)==5then neb=0end
 if mget(a,b)==4then
  return neb
 else
  return 0
 end
end

function rats()
 for x=0,7do
  for y=0,7do
   anitile[tostr(x)..tostr(y)]=flr(rnd(2))
  end
 end
end
rats()
function srcount(sa,sb)
 local sneb=0
 // get the count of captured
 // tiles around a:x,b:y.
 if mget(sa,sb+1)!=4then sneb+=neycount(sa,sb+1)end
 if mget(sa,sb-1)!=4then sneb+=neycount(sa,sb-1)end
 if mget(sa-1,sb)!=4then sneb+=neycount(sa-1,sb)end
 if mget(sa+1,sb)!=4then sneb+=neycount(sa+1,sb)end
 if mget(a,b)==4then
  return sneb
 else
  return 0
 end
end

function draw()
 cls(1)
 camera(0,0)
 if state=="game"then
 if camhack==true then camera(sx*8-28,sy*8-28)end
 se=3
 t+=1
 sc=sca[flr(((t*scspd)/count(sca)%#sca)+1)]
 ec=eca[flr(((t*scspd)/count(sca)%#sca)+1)]
 if camhack!=true then for ia=0,7do
 for ib=0,7do
 if mget(ia,ib)==1then // tile animations
  local tt=t%100
  if tt < 30 then
  spr(1,ia*8,ib*8)
  elseif tt < 50then
  spr(17,ia*8,ib*8)
  else
  spr(1,ia*8,ib*8)
  end
 elseif mget(ia,ib)==2then
  local tt=t%200
  if yelneb==true then
  if tt == 120then sfx(15)end
  if tt > 120 and tt < 131 then
  spr(50,ia*8,ib*8)
  else
  spr(34,ia*8,ib*8)
  end
  else
  if tt == 120then sfx(4)end
  if tt > 120 and tt < 131 then
  spr(18,ia*8,ib*8)
  else
  spr(2,ia*8,ib*8)
  end
  end
 elseif mget(ia,ib)==3then
  local tt=t%180
  if yelneb==true then
  if tt < 150 then
  spr(35,ia*8,ib*8)
  else
  spr(11,ia*8,ib*8)
  sfx(16)
  end
  else
  if tt < 150 then
  spr(3,ia*8,ib*8)
  else
  spr(19,ia*8,ib*8)
  sfx(5)
  end
  end
 elseif mget(ia,ib)==4or mget(ia,ib)==9then
  local tt=t%122
  if tt < 110 then
  spr(4,ia*8,ib*8)
  else
  spr(20,ia*8,ib*8)
  end
 elseif mget(ia,ib)==5then
  local tt=t%92
  if tt < 90 then
  spr(5,ia*8,ib*8)
  else
  spr(21,ia*8,ib*8)
  end
 elseif mget(ia,ib)==7then
  local tt=t%100
  if tt < 82 then
  spr(7,ia*8,ib*8)
  else
  spr(23,ia*8,ib*8)
  end
 elseif mget(ia,ib)==24then
  local tt=t%100
  if tt < 82 then
  spr(8,ia*8,ib*8)
  else
  spr(23,ia*8,ib*8)
  end
 elseif mget(ia,ib)==0then
  local tt=t%100
  if tt < 82 then
  spr(0,ia*8,ib*8)
  else
  spr(16,ia*8,ib*8)
  end
 elseif mget(ia,ib)==12then
  local tt=t%100
  if tt < 82 then
  spr(12,ia*8,ib*8)
  else
  spr(28,ia*8,ib*8)
  end
 elseif mget(ia,ib)==13then
  spr(13,ia*8,ib*8)
 end
 end
 end
 else
 map(0,0)
 end
 rect(ex*8,ey*8,ex*8+7,ey*8+7,ec)
 rect(sx*8,sy*8,sx*8+7,sy*8+7,sc)
 print(tiptext,0,0,12)
 elseif state=="menu"then
  cls(12)
  se=0
  print("the blocks of war",1,1,2)
  print("the blocks of war",0,0,8)
  print(version,1,10,5)
  print(version,0,9,13)
  palt(0,false)
  spr(64,14*8,0,2,2)
  palt(0,true)
  spr(levels[sdl].l,15*8/2,15*8/2)
  if levels[sdl].port==true then
  pref="portal"
  else
   pref="lvl"..sdl
  end
  print(pref..": "..levels[sdl].name,1,18,13)
  print(pref..": "..levels[sdl].name,0,17,6)
 elseif state=="info"then
  cls(0)
  se=0
  spr(ti,0,0)
  if inf[ti] == nil then
   ti=8
  end
  print(inf[ti].name,9,0,12)
  for txtl=0,14do
   dtxt=dll*txtl
   txt=sub(inf[ti].disc,dtxt,dtxt+dll-1)
   if sub(txt,1,1)==" "then txt=sub(txt,2,#txt)end
   if dtxt+dll <= #inf[ti].disc and sub(txt,#txt,#txt)!=" "and sub(txt,#txt,#txt)!="."and sub(txt,#txt,#txt)!="!"and sub(txt,#txt,#txt)!="?"and sub(inf[ti].disc, dtxt+#txt,dtxt+#txt) != " " then txt=txt.."-"end
   print(txt,0,9+txtl*8,6)
  end
 end
 poke(0x5f2c,se)
end

function _draw()
 draw()
end

function mc(a,b)
	//return (mget(a,b)!=6and(mget(a,b)==5or mget(a,b)==5or mget(a,b)==3or mget(a,b)==0or mget(a,b)==2or mget(a,b)==1))
	return mget(a,b)!=4
end
function me(a,b)
	return mget(a,b)==4
end

function info()
 state="info"
 ti=mget(sx,sy)
end

function whowin()
 local twin=2
 local nextw=false
 --[[for x=0,7do
  for y=0,7do
 		if not(mget(x,y)==5 or mget(x,y)==6 or mget(x,y)==1or mget(x,y)==twin)then
 			nextw=true
 		end
 		if nextw==true then break end
 	end
 	if nextw==true then break end
 end
 if nextw==true then nextw=false end]]
 for x=0,7do
  for y=0,7do
 		if mget(x,y)==4then
 			nextw=true
 		end
 		if nextw==true then break end
 	end
 	if nextw==true then break end
 end
 if nextw!=true and state=="game" then
 	if turn > 0 then
  	winner="p"..turn
  else
   winner="tie"
  end
  if turn == 2then
   sfx(17)
  else
   sfx(18)
   if sdl==dget(0)and sdl<#levels then sdl+=1end
  end
  for i=0,30do
   flip()
   draw()
   if state!="game"then break end
  end
  if turn==1and sdl>=dget(0) then dset(0,sdl+1)end
  if state=="game"then quitlevel() end
 end
end

function check()
 for x=0,7do // tile ai
  for y=0,7do
   if (mget(x,y)==4or mget(x,y)==2or mget(x,y)==3) and (mc(x,y+1)==true and mc(x,y-1)==true and mc(x-1,y)==true and mc(x+1,y)==true)then
   	mset(x,y,1)
   	sfx(2)
   end
   if mget(x,y)==5then
    if mget(x+1,y)==1or mget(x+1,y)==2or mget(x+1,y)==3then mset(x+1,y,6)end
    if mget(x-1,y)==1or mget(x-1,y)==2or mget(x-1,y)==3then mset(x-1,y,6)end
    if mget(x,y-1)==1or mget(x,y-1)==2or mget(x,y-1)==3then mset(x,y-1,6)end
    if mget(x,y+1)==2or mget(x,y+1)==3or mget(x,y+1)==1then mset(x,y+1,6)end
    if mget(x+1,y)==4then mset(x+1,y,6)end
    if mget(x-1,y)==4then mset(x-1,y,6)end
    if mget(x,y-1)==4then mset(x,y-1,6)end
    if mget(x,y+1)==4then mset(x,y+1,6)end
   end
   if mget(x,y)==9then
    if mget(x+1,y)==1or mget(x+1,y)==2or mget(x+1,y)==3then mset(x+1,y,6)end
    if mget(x-1,y)==1or mget(x-1,y)==2or mget(x-1,y)==3then mset(x-1,y,6)end
    if mget(x,y-1)==1or mget(x,y-1)==2or mget(x,y-1)==3then mset(x,y-1,6)end
    if mget(x,y+1)==2or mget(x,y+1)==3or mget(x,y+1)==1then mset(x,y+1,6)end
   end
  end
 end
end
function check2()
 for x=0,7do
  for y=0,7do
   if (mget(x,y)==4or mget(x,y)==2or mget(x,y)==3) and (mc(x,y+1)==true and mc(x,y-1)==true and mc(x-1,y)==true and mc(x+1,y)==true)then
   	mset(x,y,1)
   	sfx(2)
   end
   if mget(x,y)==6then mset(x,y,5)sfx(6)end 
   if mget(x,y)==10then mset(x,y,9)sfx(6)end 
  end
 end
end

function aiturn()
 local i=0
 while i<30do
  i+=1
  draw()
  flip()
 end
	local over=false
	local o=0
	eex=ex
	eey=ey
 if dif == "e3" then
 for aii = 1,4do
 while over==false do
   o+=1
   ex=flr(rnd(9))-1
   ey=flr(rnd(9))-1
   ex=min(7,max(ex,0))
   ey=min(7,max(ey,0))
   if mget(ex,ey)==4 and neycount(ex,ey)==aii then
   	mset(ex,ey,3)
   	eex=ex
   	eey=ey
   	sfx(0)
   	over=true
   end
   if o>32000then
   	over=false
    break
   end
 end
 if over==true then break end
 end
  for ex = 0,7do
  	for ey = 0,7do
   o+=1
   if mget(ex,ey)==4 and over!=true then
   	mset(ex,ey,3)
   	eex=ex
   	eey=ey
   	sfx(0)
   	over=true
   	break
   end
  	end
  	if over==true then break end
 	end
 elseif dif=="e4"then
 	local bc=0
 	for cx = 0,7do
  	for cy = 0,7do
  	 if mget(cx,cy)==4then
  	  bc+=1
  	 end
  	end
  end
  if bc == 5then
   sii=3
  elseif bc == 3then
   sii=2
  elseif bc == 6then
   sii=flr(rnd(1))+2
  elseif bc == 7then
   sii=3
  elseif bc == 8then
   sii=1
  elseif bc == 9then
   sii=2
  else
   sii=0
  end
  for aiii = sii,4do
  for ex = 0,7do
  	for ey = 0,7do
   o+=1
   if (mget(ex,ey)==12 or mget(ex,ey)==4) and over!=true and neycount(ex,ey)==aiii then
   	if mget(ex,ey)==12then
 		mset(ex,ey,4)
 	 if mget(ex+1,ey)!=0then mset(ex+1,ey,4)end
 	 if mget(ex-1,ey)!=0then mset(ex-1,ey,4)end
 	 if mget(ex,ey+1)!=0then mset(ex,ey+1,4)end
 	 if mget(ex,ey-1)!=0then mset(ex,ey-1,4)end
 	 sfx(14)
 	 eex=ex
   eey=ey
 	else
   	mset(ex,ey,3)
   	eex=ex
   	eey=ey
   	sfx(0)
   	end
   	over=true
   	break
   end
  	end
  	if over==true then break end
 	end
 	end
 	// bookmark
 	
 		if over!=true then for ex = 0,7do
  	for ey = 0,7do
   o+=1
   if (mget(ex,ey)==12 or mget(ex,ey)==4) and over!=true then
   	mset(ex,ey,3)
   	eex=ex
   	eey=ey
   	sfx(0)
   	over=true
   	break
   end
  	end
  	if over==true then break end
 	end end
 	if over!=true then for ex = 0,7do
  	for ey = 0,7do
   o+=1
   if (mget(ex,ey)==12 or mget(ex,ey)==4) and over!=true then
   	mset(ex,ey,3)
   	eex=ex
   	eey=ey
   	sfx(0)
   	over=true
   	break
   end
  	end
  	if over==true then break end
 	end end
 end // end of ai dif
 ex=eex
 ey=eey
 turn=2
 check()
 check2()
 whowin()
 turn=1
end

function aitur2()
 local i=0
 while i<30do
  i+=1
  draw()
  flip()
 end
	local over=false
	local o=0
 if dif == "e3" then
 while over==false do
   o+=1
   sx=flr(rnd(8))
   sy=flr(rnd(8))
   sx=min(7,max(sx,0))
   sy=min(7,max(sy,0))
   if neycount(sx,sy)==2then
   	mset(sx,sy,2) // dis(sx,sy,ex,ey)>4and
   	sfx(1)
   	over=true
   end
   if o>200then
   	over=false
    break
   end
 end
 while over==false do
   o+=1
   sx=flr(rnd(8))
   sy=flr(rnd(8))
   sx=min(7,max(sx,0))
   sy=min(7,max(sy,0))
   if mget(sx,sy) == 4 and (mget(sx,sy+1)!=4or mget(sx,sy-1)!=4or mget(sx+1,sy)!=4or mget(sx+1,sy)!=4) and (mget(sx,sy+1)!=1or mget(sx,sy-1)!=1or mget(sx+1,sy)!=1or mget(sx+1,sy)!=1)then
   	mset(sx,sy,2)
   	sfx(1)
   	over=true
   end
   if o>1000then
    break
   end
 end
 end
 turn=1
 check()
 check2()
 whowin()
 aiturn()
 turn=2
end

function update()
	if state == "game"then
 if btn(🅾️)and btn(❎)and maphack==true then 
 if btnp(➡️)then
  mset(sx,sy,mget(sx,sy)+1)
 end
 if btnp(⬅️)then
  mset(sx,sy,mget(sx,sy)-1)
 end
 else
 if btnp(➡️)then sx+=1end
 if btnp(⬅️)then sx-=1end
 if btnp(⬆️)then sy-=1end
 if btnp(⬇️)then sy+=1end
 if camhack != true then sx=min(max(sx,0),7)sy=min(max(sy,0),7)end
 if btnp(🅾️) then info(sx,sy) trans()end
 if btnp(❎)and (mget(sx,sy)==4or mget(sx,sy)==12) then
 	if mget(sx,sy)==12then
 		mset(sx,sy,4)
 	 if mget(sx+1,sy)!=0then mset(sx+1,sy,4)end
 	 if mget(sx-1,sy)!=0then mset(sx-1,sy,4)end
 	 if mget(sx,sy+1)!=0then mset(sx,sy+1,4)end
 	 if mget(sx,sy-1)!=0then mset(sx,sy-1,4)end
 	 sfx(14)
 	else
  	mset(sx,sy,2)
  	sfx(1)
  end
  check()
 	check2()
 	whowin()
  aiturn()
 elseif btnp(❎) then
 	if mget(sx,sy)==0then sfx(7)else sfx(3)end
 	sx+=0.4
 	draw()
 	flip()
 	draw()
 	flip()
 	draw()
 	flip()
 	sx-=0.8
 	draw()
 	flip()
 	draw()
 	flip()
 	sx+=0.4
 	draw()
 	flip()
 end
 end
 elseif state=="menu"then
 	if btnp(❎)then
 		if levels[sdl].imo==true then
 		 genendless()
 		end
 	 trans()
 	 sfx(2)
 	 yelneb=levels[sdl].alt
 	 lm(levels[sdl].lx,levels[sdl].ly)
 	 state="game"
 	end
 	if btnp(➡️)and sdl<#levels and sdl<dget(0) then
 	 sfx(2)
 	 trans()
 	 sdl+=1
 	end
 	if btnp(⬅️)and sdl>1then
 	 sfx(2)
 	 trans()
 	 sdl-=1
 	end
 elseif state=="info"then
 if btnp(❎)then
  state="game"
  trans()
 end
 end
end

function _update()
 update()
end
function lm(xx,yy)
 for oa=0,7do
 for ob=0,7do
 mset(oa,ob,mget(xx+oa,yy+ob))
 end
 end
end

// to do
// make them do blink at rnd

__gfx__
1551155111555511a55aa55aa55aa55a55666655a55aa55a556aa55a755775577557755755666655556551158558855865566556cccccccc7557755700000000
588558855d1551d5599aa995599aa9956d5665d6599aa995695aa9d556655665588558856d5665d66d565dd1599889955bb33bb5c11111115887788500000000
188118815dd55dd5a99aa99aa99aa99a6dd66dd6a99aa99a69d6a99a76677667788778876dd66dd66dd65dd5899889983bb33bb3c1cccccc7887788700000000
1111111155555555aaaaaaaaaaaaaaaa66666666aaaaaaaa6666aaaa777777777777777766666666666655558888888863366336c1c1111c7777777700000000
1111111155555555aaaaaaaaaaaaaaaa66666666aaaaaaaa6666aaaa777777777777777766666666666655558888888866666666c1c1cc1c7777777700000000
1d1111d15d5555d5a999999aa9aaaa9a6d6666d6aaaaaa9a6666aada7677776776777767666666d66666d5d589999998666666d6c1cccc1c7677776700000000
1dddddd15dddddd5a9a99a9aa999999a6dddddd6a999999a69d9dd9a76666667766666676dddddd66dddddd5899999986dddddd6c111111c7766667700000000
1111111155555555aaaaaaaaaaaaaaaa66666666aaaaaaaa666666aa777777777777777766666666666666558888888866666666cccccccc7777777700000000
1111111155555555aaaaaaaaa55aa55a66666666aaaaaaaa00000000777777777557755755666655000000000000000065566556000000007557755700000000
5555555511155111555aa555599aa99555566555555aa5550000000055555555588558856d5665d6000000000000000053333335000000005887788500000000
1111111155555555a99aa99aa99aa99a66666666aaaaaaaa0000000077777777788778876dd66dd6000000000000000033333333000000007887788700000000
1111111155555555aaaaaaaaaaaaaaaa66666666aaaaaaaa00000000777777777777777766666666000000000000000063366336000000007777777700000000
1111111155555555a999999aaaaaaaaa66666666aaaaaaaa00000000777777777777777766666666000000000000000066666666000000007777777700000000
1d1111d15d5555d5a9a99a9aa999999a6d6666d6aaaaaa9a000000007677776776777767666666d60000000000000000666666d6000000007666666700000000
1dddddd15dddddd5aaaaaaaaa999999a6dddddd6a999999a0000000076666667766666676dddddd600000000000000006dddddd6000000007666666700000000
1111111155555555aaaaaaaaaaaaaaaa66666666aaaaaaaa00000000777777777777777766666666000000000000000066666666000000007777777700000000
dddddddd00000000b55bb55b85588558000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dd0000dd00000000533bb33559988995000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d0d00d0d00000000b33bb33b89988998000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d00dd00d00000000bbbbbbbb88888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d00dd00d00000000bbbbbbbb88888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d0d00d0d00000000b333333b89888898000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dd0000dd00000000b3b33b3b89999998000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddddddd00000000bbbbbbbb88888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000b55bb55b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000533bb33500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000b33bb33b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000bbbbbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000b333333b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000b3b33b3b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000bbbbbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000bbbbbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ccccc7777ccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05a5cc5555cc11100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0959c167761cd5d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a9acc7667cc5d500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0cccccccccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0cccccccccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0cccccccccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
055885cccc5bb5500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
089559cccc3553b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
089889cccc3bb3b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
088888ccccbbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0999982cc3b333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
088888ccccbbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0cccccccccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
888c8c8c888ccccc888c8cccc88cc88c8c8cc88cccccc88c888ccccc8c8c888c888ccccccccccccccccccccccccccccccccccccccccccccc0000000000000000
c82282828222cccc828282cc8c828c2282828c22cccc8c828222cccc828282828282cccccccccccccccccccccccccccccccccccccccccccc0ccccc7777ccccc0
c82c888288cccccc88c282cc828282cc88c2888ccccc828288cccccc8282888288c2cccccccccccccccccccccccccccccccccccccccccccc05a5cc5555cc1110
c82c8282822ccccc828c82cc828282cc828cc282cccc8282822ccccc88828282828ccccccccccccccccccccccccccccccccccccccccccccc0959c167761cd5d0
c82c8282888ccccc8882888c88c2c88c828288c2cccc88c282cccccc888282828282cccccccccccccccccccccccccccccccccccccccccccc0a9acc7667cc5d50
cc2cc2c2c222ccccc222c222c22ccc22c2c2c22cccccc22cc2ccccccc222c2c2c2c2cccccccccccccccccccccccccccccccccccccccccccc0cccccccccccccc0
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0cccccccccccccc0
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0cccccccccccccc0
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc055885cccc5bb550
dcdcdddcdddcccccccccddccdddcdddcdddcccccdddcccccdddccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc089559cccc3553b0
d5d5d555d5d5cccccccccd5cd5d5d5d5d5d5ccccd5d5ccccd5d5cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc089889cccc3bb3b0
d5d5ddccddc5cccccccccd5cd5d5d5d5d5d5ccccd5d5ccccd5d5cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc088888ccccbbbbb0
ddd5d55cd5dccccccccccd5cd5d5d5d5d5d5ccccd5d5ccccd5d5cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0999982cc3b33330
cd55dddcd5d5cdccccccdddcddd5ddd5ddd5cdccddd5cdccddd5cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc088888ccccbbbbb0
cc5cc555c5c5cc5cccccc555c555c555c555cc5cc555cc5cc555cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0cccccccccccccc0
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0000000000000000
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
6ccc6c6c6ccc666cccccccccc66c666c666cc66c6ccc666cccccc66c666ccccc66ccc66c666cc66c666ccccccccccccccccccccccccccccccccccccccccccccc
6dcc6d6d6dcccd6dc6cccccc6cddc6dd6d6d6cdd6dcc6dddcccc6c6d6dddcccc6d6c6c6dc6dd6cdd6dddcccccccccccccccccccccccccccccccccccccccccccc
6dcc6d6d6dccc66dccdccccc6dccc6dc66cd6dcc6dcc66cccccc6d6d66cccccc6d6d6d6dc6dc666c66cccccccccccccccccccccccccccccccccccccccccccccc
6dcc666d6dcccc6dc6cccccc6dccc6dc6d6c6dcc6dcc6ddccccc6d6d6ddccccc6d6d6d6dc6dccd6d6ddccccccccccccccccccccccccccccccccccccccccccccc
666cc6dd666c666dccdcccccc66c666c6d6dc66c666c666ccccc66cd6dcccccc6d6d66cd666c66cd666ccccccccccccccccccccccccccccccccccccccccccccc
cdddccdccdddcdddccccccccccddcdddcdcdccddcdddcdddcccccddccdcccccccdcdcddccdddcddccdddcccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc556aa55acccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc695aa9d5cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc69d6a99acccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666aaaacccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666aaaacccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666aadacccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc69d9dd9acccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc666666aacccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

__map__
010103040404020100010101010101010103040404040404030504070707070404040404040404040409040707070704090101050505050101040704010407040107070707070707070404090404040409070707070707070707090404040409070c010c010c010c010101010101010101010101010101010101010101010104
01030404040402010001010101010101010404040404040404040104040404010404040704040404040404040404040404010504070707050105070407090704070704040404040407040404040404040407040407070404070704040404040407010c010c010c010c0118070d0d071801010c010c0c010c01070d070707070c
01010204040201010001010201010401010404010101010404070404040404040707040704040404040704010404010407050704040404070504070407040704070704070407070407040404090404090407040c18070c040707070404040307070c010c010c010c0101070c04040c0701010103010104010107040404040704
01010304040301010001010401010401010404010101010404070404040404040704040704040404040704040101040407050704040404070504070407040704070704070909040407040404040404040407070707071807070d0404040404180d010c0104040c010c010d040404040d01010c040c0c040c0107040c0c04070c
01020404040201010001010401010401010404010101010404070404040404040704070704040404040704040101040407050704040404070504070407040704070704040909070407040904040404040407071807070707070d0404040404180d0c010c0404010c01010d040404040d01010c040c0c040c0107040c0c04070c
01010204040403010001010401010301010404010101010404070404040404040704040704040404040704010404010407050704040404070504070407040704070704070704070407040404040404040407040c07180c04070707040404030707010c010c010c010c01070c04040c0701010104010103010107040404040704
010304040404030100010101010101010104040404040404040401040404040104070407040404040404040404040404040105070707070501040709070407050707040404040404070404040404090404070404070704040707040404040404070c010c010c010c010118070d0d071801010c010c0c010c010707070707070c
01010204040301010001010101010101010204040404040402040407070707040405040704040404040904070707070409010105050505010104010407040104070707070707070707090404040404040407070707070707070709040404040907010c010c010c010c0101010101010101010101010101010101010101010104
0000000000000000051804040404070504040404040404041804041804041804040c04040404070404040404040404040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000070c070000180c18040404040404010418040418040c181807070404040c070c04040404040404040020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c070707070c000418040404040704040404040404010404180c180418180c0c0401010101040407070707070707070020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000707070c0707000400040404040004040404040404010404180118180c18040404010c0c010404040404040404040d0020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00070c0404070c000400040404040004040404040404010404181804180404180404010c0c010404040404040404040d0020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c0704040c07000407040404041804040404040404010c18180c0418040418040401010101040c07070707070707070020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007070c07070700180c180000070c0704040404040401070404180418040c180c0704040404070704040404040404040020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c070707070c0005070404040418050404040404040005040418041804041804070c0404040c0404040404040404040020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
a8010000236500a650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1801000023650176500b6500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d60200001f6502d650306500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0610000023650186502d6500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
340500001c0202103026030210201a010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
300800000407006060010700306005070010600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
301000000405002070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8e100000155700e560175700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000200302001030010200103001020010300002000030000200003000020010300102001030010200103001020000300002000030000200103001020010300102001030000200003000020000300002000030
001000200501001020010200002002020020200202000020000200002001020000200202000020030200002000020010200302004020000200202003020040200002000020000200002002030020300003002030
001000200001001020010200002002020020200202000020000200002001020000200202000020030200002000020010200302004020000200202003020040200002000020000200002002030020300003002030
001000200301001020010200002002020020200202000020000200002001020000200202000020030200002000020010200302004020000200202003020040200002000020000200002002030020300003002030
001000000305002050040500005001050040500105003050010500305000050010500005000050010500305001050000500005001050000500305000050030500005002050010500305002050010500305001050
001000000305002050040500005001050040500105003050010500305000050010500005000050010500305001050000500005001050000500305000050030500005002050010500305002040010300302001020
300900003f670396503c6403d6201c610000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
440500001c5202153026530215201b510000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8a0800000407006060010700306005070010600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
401000003f6503e6503e6500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1110000036450294502e4500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
461000000665002650056500265001650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 08424344
01 09494344
00 0a424344
00 0a424344
02 0b4a4344
03 084b4344
00 0c4b4344
02 0d4b4344

