#SingleInstance force
CoordMode Mouse, Screen
CoordMode Pixel, Screen
gem:=Object()

^r::Reload
Esc::Suspend
`::Pause

^Space::
  ImageSearch x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, *8 Grid1.bmp
  ImageSearch x2, y2, 0, 0, A_ScreenWidth, A_ScreenHeight, *8 Grid2.bmp
  if(ErrorLevel=0){
    if(x2<x)
      x:=x2
    if(y2<y)
      y:=y2
  }
  gridx:=x-60
  gridy:=y-64
return

Space::
  MakeBoard(gridx,gridy)
  FindMoves()
  MouseMove MoveI*40+gridx, MoveJ*40+gridy, 0
  if(MoveDir=0)
    MouseClickDrag Left, 0, 0, 40, 0, , R
  else
    MouseClickDrag Left, 0, 0, 0, 40, , R

;  if(MoveDir=0)
;    MsgBox %MoveI%, %MoveJ% right`n%Cube% cubes`n%Star% stars`n%Multi% multis`n%Flame% flames`n%Match% matches
;  else
;    MsgBox %MoveI%, %MoveJ% down`n%Cube% cubes`n%Star% stars`n%Multi% multis`n%Flame% flames`n%Match% matches
return

MakeBoard(gx,gy){
  global
  bgems=0
  ggems=0
  ygems=0
  rgems=0
  ogems=0
  pgems=0
  wgems=0
  y:=gy
  j=1
  Loop 8 {
    y+=40
    x:=gx
    i=1
    Loop 8 {
      x+=40
      PixelGetColor color1, x, y
      PixelGetColor color2, x+1, y-2
      PixelGetColor color3, x, y+16
      PixelGetColor color4, x+1, y+18
      gem[i,j]:=GetColor()
      if(gem[i,j]>0){
        PixelGetColor color5, x-6, y+11
        if(color5=0xFFFFFF){
          PixelGetColor color6, x-1, y+12
          if(color6=0xFFFFFF)
            gem[i,j]+=10	; gem is a multiplier
        }
      }
;      z:=gem[i,j]
;      MsgBox %z%
      i+=1
    }
    j+=1
  }
}

GetColor(){
  global

  bpixels=0
  gpixels=0
  ypixels=0
  rpixels=0
  opixels=0
  ppixels=0
  wpixels=0

  CountPixelColor(color1)
  CountPixelColor(color2)
  bpixels:=bpixels*2
  gpixels:=gpixels*2
  ypixels:=ypixels*2
  rpixels:=rpixels*2
  opixels:=opixels*2
  ppixels:=ppixels*2
  wpixels:=wpixels*2
  CountPixelColor(color3)
  CountPixelColor(color4)

;  if(bpixels<6 and gpixels<6 and ypixels<6 and rpixels<6 and opixels<6 and ppixels<6 and wpixels<6)
;    MsgBox %i%, %j%`n%bpixels% %gpixels% %ypixels% %rpixels% %opixels% %ppixels% %wpixels%`n%color1% %color2% %color3% %color4%
  if(bpixels>3){
    bgems++
    return 1
  }else if(gpixels>3){
    ggems++
    return 2
  }else if(ypixels>3){
    ygems++
    return 3
  }else if(rpixels>3){
    rgems++
    return 4
  }else if(opixels>3){
    ogems++
    return 5
  }else if(ppixels>3){
    pgems++
    return 6
  }else if(wpixels>3){
    wgems++
    return 7
  }
;  MsgBox %i%, %j%`n%bpixels% %gpixels% %ypixels% %rpixels% %opixels% %ppixels% %wpixels%`n%color1% %color2% %color3% %color4%
  return 0
}

CountPixelColor(color){
  global

  red:=Mod(color,0x100)
  color//=0x100
  green:=Mod(color,0x100)
  blue:=color//0x100

  if(green=0)
    bg=10
  else
    bg:=blue/green
  if(red=0){
    br=10
    gr=10
  }else{
    br:=blue/red
    gr:=green/red
  }

  if(bg>.9 and bg<1.1 and br>.9 and br<1.1 and gr>.9 and gr<1.1)
    wpixels++
  else if(bg>1.1){
    if(gr>1.1)
      bpixels++
    else if(br>.7 and br<1.3)
      ppixels++
    else if(br<.9)
      rpixels++
  }else if(green>blue and gr>1.1)
    gpixels++
  else if(gr<.675){
    if(green<108 and blue>10){
      if(red>200)
        rpixels++
      else
        ypixels++
    }else
      opixels++
  }else if(br>.4 and (blue<120 or green=255))
    opixels++
  else
    ypixels++
}

FindMoves(){
  global
  Cube=-1
  Star=-1
  Multi=-1
  Flame=-1
  Match=-1
  MoveJ=0

  j=1
  Loop 8 { ; Horizontal Switches
    i=1
    Loop 7 {
      tMulti=0
      if(gem[i+1,j]>0){
        cgem:=Mod(gem[i+1,j],10)
        if(i>2 and Mod(gem[i-1,j],10)=cgem and Mod(gem[i-2,j],10)=cgem){
          LH=3
          if(gem[i-1,j]>10)
            tMulti++
          if(gem[i-2,j]>10)
            tMulti++
        }else
          LH=1

        LV=1
        tempMulti=0
        if(j>1 and Mod(gem[i,j-1],10)=cgem){
          LV++
          if(gem[i,j-1]>10)
            tempMulti++
          if(j>2 and Mod(gem[i,j-2],10)=cgem){
            LV++
            if(gem[i,j-2]>10)
              tMulti++
          }
        }
        if(j<8 and Mod(gem[i,j+1],10)=cgem){
          LV++
          if(gem[i,j+1]>10)
            tempMulti++
          if(j<7 and Mod(gem[i,j+2],10)=cgem){
            LV++
            if(gem[i,j+2]>10)
              tMulti++
          }
        }
        if(LV>2)
          tMulti+=tempMulti
        if((LH>2 or LV>2) and gem[i+1,j]>10)
          tMulti++
      }

      if(gem[i,j]>0){
        cgem:=Mod(gem[i,j],10)
        if(i<6 and Mod(gem[i+2,j],10)=cgem and Mod(gem[i+3,j],10)=cgem){
          RH=3
          if(gem[i+2,j]>10)
            tMulti++
          if(gem[i+3,j]>10)
            tMulti++
        }else
          RH=1

        RV=1
        tempMulti=0
        if(j>1 and Mod(gem[i+1,j-1],10)=cgem){
          RV++
          if(gem[i+1,j-1]>10)
            tempMulti++
          if(j>2 and Mod(gem[i+1,j-2],10)=cgem){
            RV++
            if(gem[i+1,j-2]>10)
              tMulti++
          }
        }
        if(j<8 and Mod(gem[i+1,j+1],10)=cgem){
          RV++
          if(gem[i+1,j+1]>10)
            tempMulti++
          if(j<7 and Mod(gem[i+1,j+2],10)=cgem){
            RV++
            if(gem[i+1,j+2]>10)
              tMulti++
          }
        }
        if(RV>2)
          tMulti+=tempMulti
        if((RH>2 or RV>2) and gem[i,j]>10)
          tMulti++
      }

      if(LH>2 or RH>2 or LV>2 or RV>2){
        tCube=0
        tStar=0
        tFlame=0
        tMatch=0
        if(LV=5)
          tCube++
        if(RV=5)
          tCube++
        if(LV>2 and LH>2)
          tStar++
        else{
          if(LV=3)
            tMatch++
          if(LH=3)
            tMatch++
        }
        if(RV>2 and RH>2)
          tStar++
        else{
          if(RV=3)
            tMatch++
          if(RH=3)
            tMatch++
        }
        if(LV=4)
          tFlame++
        if(RV=4)
          tFlame++
        if(tCube>Cube or (tCube=Cube and (tStar>Star or (tStar=Star and (tMulti>Multi or (tMulti=Multi and (tFlame>Flame or (tFlame=Flame and (tMatch>Match or (tMatch=tMatch and j>MoveJ)))))))))){
          Cube:=tCube
          Star:=tStar
          Multi:=tMulti
          Flame:=tFlame
          Match:=tMatch
          MoveI:=i
          MoveJ:=j
        }
      }
      i++
    }
    j++
  }
  MoveDir=0

  j=1
  Loop 7 { ; Vertical Switches
    i=1
    Loop 8 {
      tMulti=0
      if(gem[i,j+1]>0){
        cgem:=Mod(gem[i,j+1],10)
        if(j>2 and Mod(gem[i,j-1],10)=cgem and Mod(gem[i,j-2],10)=cgem){
          TV=3
          if(gem[i,j-1]>10)
            Mult++
          if(gem[i,j-2]>10)
            Mult++         
        }else
          TV=1

        TH=1
        tempMulti=0
        if(i>1 and Mod(gem[i-1,j],10)=cgem){
          TH++
          if(gem[i-1,j]>10)
            tempMulti++
          if(i>2 and Mod(gem[i-2,j],10)=cgem){
            TH++
            if(gem[i-2,j]>10)
              tMulti++
          }
        }
        if(i<8 and Mod(gem[i+1,j],10)=cgem){
          TH++
          if(gem[i+1,j]>10)
            tempMulti++
          if(i<7 and Mod(gem[i+2,j],10)=cgem){
            TH++
            if(gem[i+2,j]>10)
              tMulti++
          }
        }
        if(TH>2)
          tMulti+=tempMulti
        if((TV>2 or TH>2) and gem[i,j+1]>10)
          tMulti++
      }

      if(gem[i,j]>0){
        cgem:=Mod(gem[i,j],10)
        if(j<6 and Mod(gem[i,j+2],10)=cgem and Mod(gem[i,j+3],10)=cgem){
          BV=3
          if(gem[i,j+2]>10)
            Mult++
          if(gem[i,j+3]>10)
            Mult++         
        }else
          BV=1

        BH=1
        tempMulti=0
        if(i>1 and Mod(gem[i-1,j+1],10)=cgem){
          BH++
          if(gem[i-1,j+1]>10)
            tempMulti++
          if(i>2 and Mod(gem[i-2,j+1],10)=cgem){
            BH++
            if(gem[i-2,j+1]>10)
              tMulti++
          }
        }
        if(i<8 and Mod(gem[i+1,j+1],10)=cgem){
          BH++
          if(gem[i+1,j+1]>10)
            tempMulti++
          if(i<7 and Mod(gem[i+2,j+1],10)=cgem){
            BH++
            if(gem[i+2,j+1]>10)
              tMulti++
          }
        }
        if(BH>2)
          tMulti+=tempMulti
        if((BV>2 or BH>2) and gem[i,j]>10)
          tMulti++
      }

      if(TV>2 or BV>2 or TH>2 or BH>2){
        tCube=0
        tStar=0
        tFlame=0
        tMatch=0
        if(TH=5)
          tCube++
        if(BH=5)
          tCube++
        if(TH>2 and TV>2)
          tStar++
        else{
          if(TH=3)
            tMatch++
          if(TV=3)
            tMatch++
        }
        if(BH>2 and BV>2)
          tStar++
        else{
          if(BH=3)
            tMatch++
          if(BV=3)
            tMatch++
        }
        if(TH=4)
          tFlame++
        if(BH=4)
          tFlame++
        if(tCube>Cube or (tCube=Cube and (tStar>Star or (tStar=Star and (tMulti>Multi or (tMulti=Multi and (tFlame>Flame or (tFlame=Flame and (tMatch>Match or (tMatch=tMatch and j>MoveJ)))))))))){
          Cube:=tCube
          Star:=tStar
          Multi:=tMulti
          Flame:=tFlame
          Match:=tMatch
          MoveI:=i
          MoveJ:=j
          MoveDir=1
        }
      }
      i++
    }
    j++
  }
}
