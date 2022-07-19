pico-8 cartridge // http://www.pico-8.com
version 35
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
version="ver. 1.0.5"
inf={}
dll=26
sdl=1
camhack=false
maphack=true
cheats=false
offset={}
delay=180
for i=0,7do
offset[i]={}
for i2=0,7do
offset[i][i2]=flr(rnd(80))
end
end
inf[16]={name="shy red-eyed staller",disc="he's a little shy, he trys to stay off-screen away from the player. still don't like his red eyes tho."}
inf[1]={name="peaceful villager",disc="he's very happy to be back to normal, he's not fighting anymore. nothing could make him angry again..."}
inf[4]={name="villager",disc="he's havin' a great life! he's hangin' out with his children, and having lots of fun!"}
inf[2]={name="annoyed pumkin' villager",disc=[[he hates that loud noise the noisy villagers are making. they yell every day and night. nobody can get any sleep!]]}
inf[3]={name="noisy villager",disc=[[they are very annoying, he has a voice so booming, it wakes everyone up! the punkin' villagers can't take it anymore!]]}
inf[7]={name="careless staller",disc=[[he hears, "they're very annoying, help use quiet em' down!" "yawn. i really don't care," he responds. "let's cause some chaos!" the chaos villagers say. "yawn. go away, i just want to stand here in everyone's way," he responds. he's very boring.]]}
inf[5]={name="chaos villager",disc=[[and oh boy, is she annoying. she wakes up villagers at 1 a.m. and blames it on the noisy villagers when they had nothing to do with it. she blames others for knocking over pots, when she did it. and somehow, she gets away with it every time. no wonder the noisy villager's info is "incorrect!"]]}
inf[9]={name="chaos villager",disc=[[aw man! you found me!]]}
inf[6]={name="conversion",disc=[[you expected it to crash, didn't you? nope! this guy used to be the exploding villager, he was yellow. yes this tile has a name, it's conversion. never knew that, didn't ya. maybe you did...]]}
inf[8]={name="crash",disc=[[uh oh, he it comes. wait for it... anytime now... and... crash! nothing happened. did you think i wouldn't patch that?]]}
inf[24]={name="cranky staller",disc=[[he's gotten bored stalling everyone overtime. but he still goes, stalling everyone. don't like his red eyes tho...]]}
inf[12]={name="explody bomb",disc=[[chao's latest invention... the bomb!]]}
inf[32]={name="empty space",disc=[[if you find this block, please report this to dev!]]}
infori=inf
inf2={}
inf2[1]=inf
inf2[2]=inf
inf2[12]=inf
inf2[1][2]={mask=50,name="chaos pumkin' villager",disc="kinda strange, he says he's not chaos villager. but now that you look into the past. he was apart of the chaos gang all along!"}
inf2[2][2]={mask=49,name="pumkin' with googles",disc="they look aweful. ._."}
inf2[1][5]={mask=10,name="conversion",disc="the process of turning a villager into a chaos villager. this is just a skin tho."}
inf2[12][1]={mask=37,name="trainy bomb",disc="in training, chaos villager learned how to move the stallers of the board. the bomb! its their lastest invention."}
hard="e4"
dif=hard
levels={}
olver=1
function oldver(but)
 if but==2and olver<4 then
  olver+=1
 end
 if but==1and olver>1then
  olver-=1
 end
 if but==112then
  load("#bowau-"..olver-1)
  run()
 end
 menuitem(4,"version "..olver,oldver)
 return 0
end
menuitem(4,"version 1",oldver)
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
levels[20]={port=true,alt=true,name="the box of magic",l=13,lx=32,ly=8}
levels[21]={name="it gets harder",l=13,lx=40,ly=8}
levels[22]={imo=true,port=true,name="random challenge",l=14,lx=49,ly=9}
yelneb=false
blocks={}
blocks[0]={7,7,7,7,1,4,24,24}
blocks[1]={8,12,12,24,24,24,16,16}
blocks[2]={1,12,12,1,1,1}
skins={}
// set skins
seed=stat(92)
seed+=stat(90)
seed+=stat(91)
seed+=stat(94)
seed=abs(seed)
srand(seed)
function intrand(a,b)
 return flr(rnd(b))-(a+1)
end
skins[2]=intrand(0,2)
skins[5]=intrand(0,1)
skins[12]=intrand(0,1)

function genendless()
 for i=0,1 do
 for o1 = 49,56do
 for o2 = 9,16do
 if mget(o1,o2) == 32 or true then
 bks=blocks[0]
 selb=bks[flr(rnd(#bks))]
 if selb == 7 then
  mset(o1+1,o2,4)
  mset(o1-1,o2,4)
  mset(o1,o2+1,4)
  mset(o1,o2-1,4)
 elseif selb == 12 then
  bks=blocks[1]
  mset(o1+1,o2,rnd({7,16,8}))
  mset(o1-1,o2,rnd({7,16,8}))
  mset(o1,o2+1,rnd({7,16,8}))
  mset(o1,o2-1,rnd({7,16,8}))
 elseif selb == 8 then
  bks=blocks[1]
  mset(o1+1,o2,rnd(bks))
  mset(o1-1,o2,rnd(bks))
  mset(o1,o2+1,rnd(bks))
  mset(o1,o2-1,rnd(bks))
 elseif selb == 1 then
  bks=blocks[2]
  mset(o1+1,o2,rnd(bks))
  mset(o1-1,o2,rnd(bks))
  mset(o1,o2+1,rnd(bks))
  mset(o1,o2-1,rnd(bks))
 end
 mset(o1,o2,bks[flr(rnd(#bks))])
 end
 end
 end
 end
 for o1 = 49,56do
 for o2 = 9,16do
 if mget(o1,o2)==0 then
 mset(o1,o2,16)
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
 off=offset[ia][ib]
 if mget(ia,ib)==1then // tile animations
  local tt=(t+off)%(100+delay)
  if tt < 30+delay  then
  spr(1,ia*8,ib*8)
  elseif tt < 50+delay then
  spr(17,ia*8,ib*8)
  else
  spr(1,ia*8,ib*8)
  end
 elseif mget(ia,ib)==2then
  local tt=(t+off)%(200+delay)
  if yelneb==true or skins[2]==1 then
  if tt == 120+delay then sfx(15)end
  if tt > 120+delay and tt < 131+delay then
  spr(50,ia*8,ib*8)
  else
  spr(34,ia*8,ib*8)
  end
  else
  if tt == 120+delay then sfx(4)end
  if tt > 120+delay and tt < 131+delay then
  spr(18,ia*8,ib*8)
  else
  spr(2,ia*8,ib*8)
  end
  end
 elseif mget(ia,ib)==3then
  local tt=(t+off)%(180+delay)
  if yelneb==true then
  if tt < 150+delay then
  spr(35,ia*8,ib*8)
  else
  spr(11,ia*8,ib*8)
  sfx(16)
  end
  else
  if tt < 150+delay then
  spr(3,ia*8,ib*8)
  else
  spr(19,ia*8,ib*8)
  sfx(5)
  end
  end
 elseif mget(ia,ib)==4or mget(ia,ib)==9then
  local tt=(t+off)%(122+delay)
  if tt < 110+delay then
  spr(4,ia*8,ib*8)
  else
  spr(20,ia*8,ib*8)
  end
 elseif mget(ia,ib)==5then
  local tt=(t+off)%(92+delay)
  if skins[5]==1then
  if tt < 90+delay then
  spr(10,ia*8,ib*8)
  else
  spr(26,ia*8,ib*8)
  end
  else
  if tt < 90+delay then
  spr(5,ia*8,ib*8)
  else
  spr(21,ia*8,ib*8)
  end
  end
 elseif mget(ia,ib)==7then
  local tt=(t+off)%(100+delay)
  if tt < 82+delay then
  spr(7,ia*8,ib*8)
  else
  spr(23,ia*8,ib*8)
  end
 elseif mget(ia,ib)==24then
  local tt=(t+off)%(100+delay)
  if tt < 82+delay then
  spr(8,ia*8,ib*8)
  else
  spr(23,ia*8,ib*8)
  end
 elseif mget(ia,ib)==16then
  local tt=(t+off)%(100+delay)
  if tt < 82+delay then
  spr(0,ia*8,ib*8)
  else
  spr(16,ia*8,ib*8)
  end
 elseif mget(ia,ib)==12then
  local tt=(t+off)%(100+delay)
  if tt < 82+delay then
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
 //print(tiptext,0,0,12)
 print(mget(sx,sy),0,0,12)
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
  local til=inf[ti]
  se=0
  if inf[ti] == nil then
   ti=8
  end
  spr(inf[ti].mask or ti,0,0)
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
 	 if mget(ex+1,ey)!=16then mset(ex+1,ey,4)end
 	 if mget(ex-1,ey)!=16then mset(ex-1,ey,4)end
 	 if mget(ex,ey+1)!=16then mset(ex,ey+1,4)end
 	 if mget(ex,ey-1)!=16then mset(ex,ey-1,4)end
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
 for sk1,sk2 in pairs(skins)do
  if skins[sk1]!=nil then
   if skins[sk1]>0then
    inf[sk1]=inf2[skins[sk1]][sk2]
   else
    inf[sk1]=infori[sk1]
   end
  end
 end
	if state == "game"then
 --if btn(🅾️)and btn(❎)and maphack==true then 
 if btnp(➡️,1)then
  mset(sx,sy,mget(sx,sy)+1)
 end
 if btnp(⬅️,1)then
  mset(sx,sy,mget(sx,sy)-1)
 end
 --else
 if btnp(➡️)then sx+=1end
 if btnp(⬅️)then sx-=1end
 if btnp(⬆️)then sy-=1end
 if btnp(⬇️)then sy+=1end
 if camhack != true then sx=min(max(sx,0),7)sy=min(max(sy,0),7)end
 if btnp(🅾️) then info(sx,sy) trans()end
 if btnp(❎)and (mget(sx,sy)==4or mget(sx,sy)==12) then
 	if mget(sx,sy)==12then
 		mset(sx,sy,4)
 	 if mget(sx+1,sy)!=16then mset(sx+1,sy,4)end
 	 if mget(sx-1,sy)!=16then mset(sx-1,sy,4)end
 	 if mget(sx,sy+1)!=16then mset(sx,sy+1,4)end
 	 if mget(sx,sy-1)!=16then mset(sx,sy-1,4)end
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
 	if mget(sx,sy)==16then sfx(7)else sfx(3)end
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
 --end
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
// fix endless
__gfx__
111111115115511555bbbb55558888556556655655aaaa5555a6655677777777777777775566665555655115555aa55555266255111111115577775500000000
555555551dd55dd1b35bb53b895885985dd66dd5a95aa59aa9566d9555555555555555556d5665d66d565dd1a99aa99a285a25821ccccccc7857758700000000
188118815dd55dd5b33bb33b899889986dd66dd6a99aa99aa9da6dd676677667788778876dd66dd66dd65dd5a99aa99a288928821c1111117887788700000000
1111111155555555bbbbbbbb8888888866666666aaaaaaaaaaaa666677777777777777776666666666665555aaaaaaaa622642261c1cccc17777777700000000
1111111155555555bbbbbbbb8888888866666666aaaaaaaaaaaa666677777777777777776666666666665555aaaaaaaa666556661c1c11c17777777700000000
111111115d5555d5b3b33b3b899999986d6666d6aaaaaa9aaaaad6d67777777777777777666666d66666d5d5a999999a665555661c1111c17766667700000000
1dddddd15dddddd5b333333b898888986dddddd6a999999aa9d9dd9676666667766666676dddddd66dddddd5a999999a665555661cccccc17677776700000000
1111111155555555bbbbbbbb8888888866666666aaaaaaaaaaaaaa6677777777777777776666666666666655aaaaaaaa66655666111111117777777700000000
111111115555555555bbbb555558855566666666aaaaaaaa00000000777777777777777755666655666555550000000055266255000000005577775500000000
5555555511155111b35bb53b8998899855566555555aa5550000000055555555555555556d5665d65556511100000000225a2522000000007857758700000000
1111111155555555b33bb33b8998899866666666aaaaaaaa0000000077777777788778876dd66dd6666655550000000022292222000000007887788700000000
1111111155555555bbbbbbbb8888888866666666aaaaaaaa00000000777777777777777766666666666655550000000062264226000000007777777700000000
1111111155555555b3b33b3b8888888866666666aaaaaaaa00000000777777777777777766666666666655550000000066655666000000007777777700000000
111111115d5555d5b333333b899999986d6666d6aaaaaa9a000000007777777777777777666666d66666d5d50000000066555566000000007666666700000000
1dddddd15dddddd5bbbbbbbb899999986dddddd6a999999a0000000076666667766666676dddddd66dddddd50000000066555566000000007666666700000000
1111111155555555bbbbbbbb8888888866666666aaaaaaaa00000000777777777777777766666666666666550000000066655666000000007777777700000000
dddddddd0000000055aaaa5555aaaa555526625555266255777777770000000000000000000000000000000000000000000000000000000000000000552bb255
dd0000dd00000000a95aa59aa95aa59a285225822952259255577555000000000000000000000000000000000000000000000000000000000000000023522532
d0d00d0d00000000a99aa99aa99aa99a288228822992299276677667000000000000000000000000000000000000000000000000000000000000000023322332
d00dd00d00000000aaaaaaaaaaaaaaaa6226622662266226777777770000000000000000000000000000000000000000000000000000000000000000b22bb22b
d00dd00d00000000aaaaaaaaaaaaaaaa6666666666666666777777770000000000000000000000000000000000000000000000000000000000000000bbbbbbbb
d0d00d0d00000000a9a99a9aa999999a6655556666555566776666770000000000000000000000000000000000000000000000000000000000000000b3b33b3b
dd0000dd00000000a999999aa9aaaa9a6566665665666656767777670000000000000000000000000000000000000000000000000000000000000000b333333b
dddddddd00000000aaaaaaaaaaaaaaaa6666666666666666777777770000000000000000000000000000000000000000000000000000000000000000bbbbbbbb
0000000000000000aaaaaaaaa55aa55a55266255222662225772277555722755a55a5115000000000000000000000000000000000000000000000000552bb255
0000000000000000555aa555599aa99522522522222222227557755772577527599a5dd100000000000000000000000000000000000000000000000023522532
0000000000000000a99aa99aa99aa99a28822882222222227667766772877827a99a5dd500000000000000000000000000000000000000000000000023322332
0000000000000000aaaaaaaaaaaaaaaa62266226622662267777777727777772aaaa5555000000000000000000000000000000000000000000000000b22bb22b
0000000000000000a9a99a9aaaaaaaaa66666666666666662777777227777772aaaaa555000000000000000000000000000000000000000000000000b3b33b3b
0000000000000000a999999aaa9999aa66555566665555667766667777666677aa999d55000000000000000000000000000000000000000000000000b333333b
0000000000000000aaaaaaaaa999999a65666656656666567677776776777767a9999dd5000000000000000000000000000000000000000000000000bbbbbbbb
0000000000000000aaaaaaaaaaaaaaaa66666666666666667777777777777777aaaaaa55000000000000000000000000000000000000000000000000bbbbbbbb
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
aaaaaa11aaaaaa11aaaaaa5555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
aaaaaa11aaaaaa11aaaaaa5555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
1155aa555555aa115555aa5555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
1155aa555555aa115555aa5555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
11aaaa5555aaaa1155aaaa5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd55
11aaaa5555aaaa1155aaaa5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd55
11555555555555115555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
11555555555555115555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
11aa555555aa551155aa555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
11aa555555aa551155aa555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
11dd55555555dd1155dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd55
11dd55555555dd1155dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd55
11dddddddddddd1155dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd55
11dddddddddddd1155dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd55
11111111111111115555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
11111111111111115555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5555555555555555bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb888888888888888888888888888888885555555555555555
5555555555555555bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb888888888888888888888888888888885555555555555555
5555555555555555bb33bbbbbbbb33bbbb33bbbbbbbb33bbbb33bbbbbbbb33bbbb33bbbbbbbb33bb889988888888998888998888888899885555555555555555
5555555555555555bb33bbbbbbbb33bbbb33bbbbbbbb33bbbb33bbbbbbbb33bbbb33bbbbbbbb33bb889988888888998888998888888899885555555555555555
55dddd5555dddd55bb3333bbbb3333bbbb3333bbbb3333bbbb3333bbbb3333bbbb3333bbbb3333bb8899998888999988889999888899998855dddd5555dddd55
55dddd5555dddd55bb3333bbbb3333bbbb3333bbbb3333bbbb3333bbbb3333bbbb3333bbbb3333bb8899998888999988889999888899998855dddd5555dddd55
5555555555555555bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb888888888888888888888888888888885555555555555555
5555555555555555bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb888888888888888888888888888888885555555555555555
5555555555555555bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb888888888888888888888888888888885555555555555555
5555555555555555bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb888888888888888888888888888888885555555555555555
55dd55555555dd55bb33bbbbbbbb33bbbb33bbbbbbbb33bbbb33bbbbbbbb33bbbb33bbbbbbbb33bb8899888888889988889988888888998855dd55555555dd55
55dd55555555dd55bb33bbbbbbbb33bbbb33bbbbbbbb33bbbb33bbbbbbbb33bbbb33bbbbbbbb33bb8899888888889988889988888888998855dd55555555dd55
55dddddddddddd55bb333333333333bbbb333333333333bbbb333333333333bbbb333333333333bb8899999999999988889999999999998855dddddddddddd55
55dddddddddddd55bb333333333333bbbb333333333333bbbb333333333333bbbb333333333333bb8899999999999988889999999999998855dddddddddddd55
5555555555555555bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb888888888888888888888888888888885555555555555555
5555555555555555bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb888888888888888888888888888888885555555555555555
bbbbbbbbbbbbbbbb6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666668888888888888888
bbbbbbbbbbbbbbbb6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666668888888888888888
bb33bbbbbbbb33bb66dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd668899888888889988
bb33bbbbbbbb33bb66dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd668899888888889988
bb3333bbbb3333bb66dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd668899998888999988
bb3333bbbb3333bb66dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd668899998888999988
bbbbbbbbbbbbbbbb6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666668888888888888888
bbbbbbbbbbbbbbbb6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666668888888888888888
bbbbbbbbbbbbbbbb6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666668888888888888888
bbbbbbbbbbbbbbbb6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666668888888888888888
bb33bbbbbbbb33bb66dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd668899888888889988
bb33bbbbbbbb33bb66dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd668899888888889988
bb333333333333bb66dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd668899999999999988
bb333333333333bb66dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd668899999999999988
bbbbbbbbbbbbbbbb6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666668888888888888888
bbbbbbbbbbbbbbbb6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666668888888888888888
bbbbbbbbbbbbbbbb6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666668888888888888888
bbbbbbbbbbbbbbbb6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666668888888888888888
bb33bbbbbbbb33bb66dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd668899888888889988
bb33bbbbbbbb33bb66dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd668899888888889988
bb3333bbbb3333bb66dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd668899998888999988
bb3333bbbb3333bb66dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd668899998888999988
bbbbbbbbbbbbbbbb6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666668888888888888888
bbbbbbbbbbbbbbbb6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666668888888888888888
bbbbbbbbbbbbbbbb6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666668888888888888888
bbbbbbbbbbbbbbbb6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666668888888888888888
bb33bbbbbbbb33bb66dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd668899888888889988
bb33bbbbbbbb33bb66dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd668899888888889988
bb333333333333bb66dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd668899999999999988
bb333333333333bb66dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd668899999999999988
bbbbbbbbbbbbbbbb6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666668888888888888888
bbbbbbbbbbbbbbbb6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666668888888888888888
8888888888888888666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666bbbbbbbbbbbbbbbb
8888888888888888666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666bbbbbbbbbbbbbbbb
889988888888998866dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd66bb33bbbbbbbb33bb
889988888888998866dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd66bb33bbbbbbbb33bb
889999888899998866dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd66bb3333bbbb3333bb
889999888899998866dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd66bb3333bbbb3333bb
8888888888888888666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666bbbbbbbbbbbbbbbb
8888888888888888666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666bbbbbbbbbbbbbbbb
8888888888888888666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666bbbbbbbbbbbbbbbb
8888888888888888666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666bbbbbbbbbbbbbbbb
889988888888998866dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd66bb33bbbbbbbb33bb
889988888888998866dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd66bb33bbbbbbbb33bb
889999999999998866dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd66bb333333333333bb
889999999999998866dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd66bb333333333333bb
8888888888888888666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666bbbbbbbbbbbbbbbb
8888888888888888666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666bbbbbbbbbbbbbbbb
8888888888888888666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666bbbbbbbbbbbbbbbb
8888888888888888666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666bbbbbbbbbbbbbbbb
889988888888998866dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd66bb33bbbbbbbb33bb
889988888888998866dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd66bb33bbbbbbbb33bb
889999888899998866dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd66bb3333bbbb3333bb
889999888899998866dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd6666dddd66bb3333bbbb3333bb
8888888888888888666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666bbbbbbbbbbbbbbbb
8888888888888888666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666bbbbbbbbbbbbbbbb
8888888888888888666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666bbbbbbbbbbbbbbbb
8888888888888888666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666bbbbbbbbbbbbbbbb
889988888888998866dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd66bb33bbbbbbbb33bb
889988888888998866dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd6666dd66666666dd66bb33bbbbbbbb33bb
889999999999998866dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd66bb333333333333bb
889999999999998866dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd6666dddddddddddd66bb333333333333bb
8888888888888888666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666bbbbbbbbbbbbbbbb
8888888888888888666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666bbbbbbbbbbbbbbbb
55555555555555558888888888888888888888888888888888888888888888888888888888888888bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb5555555555555555
55555555555555558888888888888888888888888888888888888888888888888888888888888888bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb5555555555555555
55555555555555558899888888889988889988888888998888998888888899888899888888889988bb33bbbbbbbb33bbbb33bbbbbbbb33bb5555555555555555
55555555555555558899888888889988889988888888998888998888888899888899888888889988bb33bbbbbbbb33bbbb33bbbbbbbb33bb5555555555555555
55dddd5555dddd558899998888999988889999888899998888999988889999888899998888999988bb3333bbbb3333bbbb3333bbbb3333bb55dddd5555dddd55
55dddd5555dddd558899998888999988889999888899998888999988889999888899998888999988bb3333bbbb3333bbbb3333bbbb3333bb55dddd5555dddd55
55555555555555558888888888888888888888888888888888888888888888888888888888888888bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb5555555555555555
55555555555555558888888888888888888888888888888888888888888888888888888888888888bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb5555555555555555
55555555555555558888888888888888888888888888888888888888888888888888888888888888bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb5555555555555555
55555555555555558888888888888888888888888888888888888888888888888888888888888888bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb5555555555555555
55dd55555555dd558899888888889988889988888888998888998888888899888899888888889988bb33bbbbbbbb33bbbb33bbbbbbbb33bb55dd55555555dd55
55dd55555555dd558899888888889988889988888888998888998888888899888899888888889988bb33bbbbbbbb33bbbb33bbbbbbbb33bb55dd55555555dd55
55dddddddddddd558899999999999988889999999999998888999999999999888899999999999988bb333333333333bbbb333333333333bb55dddddddddddd55
55dddddddddddd558899999999999988889999999999998888999999999999888899999999999988bb333333333333bbbb333333333333bb55dddddddddddd55
55555555555555558888888888888888888888888888888888888888888888888888888888888888bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb5555555555555555
55555555555555558888888888888888888888888888888888888888888888888888888888888888bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb5555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd55
55dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd5555dddd55
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd55
55dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd5555dd55555555dd55
55dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd55
55dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd5555dddddddddddd55
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555

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
1010101010101010070c071010180c18040404040404010418040418040c181807070404040c070c04040404040404040020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
100c070707070c100418040404040704040404040404010404180c180418180c0c0401010101040407070707070707070020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
100707070c0707100410040404041004040404040404010404180118180c18040404010c0c010404040404040404040d0020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10070c0404070c100410040404041004040404040404010404181804180404180404010c0c010404040404040404040d0020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
100c0704040c07100407040404041804040404040404010c18180c0418040418040401010101040c07070707070707070020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1007070c07070710180c181010070c0704040404040401070404180418040c180c0704040404070704040404040404040020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
100c070707070c1005070404040418050404040404040005040418041804041804070c0404040c0404040404040404040020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

