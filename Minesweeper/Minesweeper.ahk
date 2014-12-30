#SingleInstance force
CoordMode Mouse, Screen
CoordMode Pixel, Screen
square:=Object()
partials:=Object()
grid:=Object()
guesses:=Object()

^r::Reload
Esc::Suspend
`::Pause

~F2::NewGame()

^Space::Play()

NewGame(){
  global
  GameOver=0
  ImageSearch x1, y1, 0, 0, A_ScreenWidth, A_ScreenHeight, TopLeft.bmp
;  MouseMove x1, y1
;  MsgBox %x1% %y1%
  ImageSearch x2, y2, 0, 0, A_ScreenWidth, A_ScreenHeight, BottomRight.bmp
;  MouseMove x2, y2
;  MsgBox %x2% %y2%
  IMax:=(x2-x1-12)/16
  JMax:=(y2-y1-14)/16
;  MsgBox %IMax% %JMax%
  x1+=4
  j=0
  Loop %JMax% {
    j++
    i=0
    Loop %IMax% {
      i++
      square[i,j]:=-1
    }
  }
}

Play(){
  UpdateBoard()
  Strategize1()
  ClickBoard()
}

UpdateBoard(){
  global
  y:=y1
  j=0
  Loop %JMax% {
    y+=16
    j++
    x:=x1
    i=0
    Loop %IMax% {
      x+=16
      i++
      if(square[i,j]=-1){
        PixelGetColor color, x-8, y-2
        if(color!=0xFFFFFF){
          PixelGetColor color, x, y
          ; MsgBox %x%, %y%`n%i%, %j%,`n%color%
          if(color=0xFF0000)
            square[i,j]:=1
          else if(color=0x008000)
            square[i,j]:=2
          else if(color=0x0000FF)
            square[i,j]:=3
          else if(color=0x800000)
            square[i,j]:=4
          else if(color=0x000080)
            square[i,j]:=5
          else if(color=0x808000)
            square[i,j]:=6
          else if(color=0x000000)
            square[i,j]:=7
          else if(color=0x808080)
            square[i,j]:=8
          else{
            PixelGetColor color, x+2, y+5
            if(color=0xC0C0C0)
              square[i,j]:=0
            else if(color=0x000000)
              GameOver=1 ; square[i,j]:=10 ; mine, lost game
            else
              MsgBox wtf
          }
        }
;        if(square[i,j]!=-1)
;          z:=square[i,j]
;          MsgBox %i%, %j%, %z%
;        }
      }
    }
  }
}

Strategize1(){
  global

  ; 1-8 known
  ; -1 unknown
  ; -2 click
  ; -3 solved (surrounding 8 squares)
  ; -4 mine

  j=0
  Loop %JMax% {
    j++
    i=0
    Loop %IMax% { ; Find fully determined squares
      i++
      if(square[i,j]>0){
        ; MsgBox checking square %i%, %j%
        SquareChanged=0
        count=0
        jj:=j-2
        Loop 3 {
          jj++
          if(jj>0 and jj<=JMax){
            ii:=i-2
            Loop 3 {
              ii++
              if(ii>0 and ii<=IMax and (square[ii,jj]=-1 or square[ii,jj]=-4)){
                ; MsgBox counting square %ii%, %jj%
                count++
                ; don't have to check for i=ii and j=jj because square[i,j] is never -1 or -4
                if(square[ii,jj]=-1)
                  SquareChanged=1
              }
            }
          }
        }
        ; MsgBox counted %count% possibles
        if(count=square[i,j]){ ; if square is fully determined
          ; MsgBox square %i%, %j% solved, SquareChanged=%SquareChanged%
          square[i,j]:=-3 ; mark square as solved
          if(SquareChanged=1){
            jj:=j-2
            Loop 3 {
              jj++
              if(jj>0 and jj<=JMax){
                ii:=i-2
                Loop 3 {
                  ii++
                  if(ii>0 and ii<=IMax and square[ii,jj]=-1){
                    square[ii,jj]:=-4 ; change unknowns to mines
                    ; MsgBox marking %ii%, %jj% as a mine
                  }
                }
              }
            }
          }
        }
      }
    }
  }

;  j=0
;  Loop %JMax% {
;    j++
;    i=0
;    Loop %IMax% {
;      i++
;      z:=square[i,j]
;      MsgBox %z%
;    }
;  }

  BoardChanged=0
  j=0
  Loop %JMax% {
    j++
    i=0
    Loop %IMax% { ; Find solved squares
      i++
      if(square[i,j]>0){
        SquareChanged=0
        count=0
        jj:=j-2
        Loop 3 {
          jj++
          if(jj>0 and jj<=JMax){
            ii:=i-2
            Loop 3 {
              ii++
              if(ii>0 and ii<=IMax){
                if(square[ii,jj]=-4)
                  count++
                else if(square[ii,jj]=-1)
                  SquareChanged=1
              }
            }
          }
        }
        if(count=square[i,j]){ ; if all mines are accounted for
          square[i,j]:=-3 ; mark square as solved
          if(SquareChanged=1){
            jj:=j-2
            Loop 3 {
              jj++
              if(jj>0 and jj<=JMax){
                ii:=i-2
                Loop 3 {
                  ii++
                  if(ii>0 and ii<=IMax and square[ii,jj]=-1){
                    square[ii,jj]:=-2 ; change remaining unknowns to clicks
                    BoardChanged=1
                    ; MsgBox will click square %ii%, %jj%
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if(BoardChanged=0)
    Strategize2()
}

Strategize2(){
  global

  ; MsgBox Partials

  ; 1-8 known
  ; -1 unknown
  ; -2 click
  ; -3 solved (surrounding 8 squares)
  ; -4 mine
  ; -5 partial

  j=0
  Loop %JMax% {
    j++
    i=0
    Loop %IMax% { ; Find partially determined squares
      i++
      if(square[i,j]>0){
        ; MsgBox checking square %i%, %j%
        jjj=-3
        Loop 5 {
          jjj++
          iii=-3
          Loop 5 {
            iii++
            grid[iii,jjj]:=1
          }
        }
        grid[0,0]:=0
        if(i<3){
          jjj=-3
          Loop 5 {
            jjj++
            grid[-2,jjj]:=0
          }
          ; MsgBox i<3
          ; ReportGrid()
        }
        if(i=1){
          jjj=-3
          Loop 5 {
            jjj++
            grid[-1,jjj]:=0
          }
          ; MsgBox i=1
          ; ReportGrid()
        }
        if(i=IMax){
          jjj=-3
          Loop 5 {
            jjj++
            grid[1,jjj]:=0
          }
          ; MsgBox i=IMax
          ; ReportGrid()
        }
        if(i>IMax-2){
          jjj=-3
          Loop 5 {
            jjj++
            grid[2,jjj]:=0
          }
          ; MsgBox i>IMax-2
          ; ReportGrid()
        }
        if(j<3){
          iii=-3
          Loop 5 {
            iii++
            grid[iii,-2]:=0
          }
          ; MsgBox j<3
          ; ReportGrid()
        }
        if(j=1){
          iii=-3
          Loop 5 {
            iii++
            grid[iii,-1]:=0
          }
          ; MsgBox j=1
          ; ReportGrid()
        }
        if(j=JMax){
          iii=-3
          Loop 5 {
            iii++
            grid[iii,1]:=0
          }
          ; MsgBox j=JMax
          ; ReportGrid()
        }
        if(j>JMax-2){
          iii=-3
          Loop 5 {
            iii++
            grid[iii,2]:=0
          }
          ; MsgBox j>JMax-2
          ; ReportGrid()
        }
        unknowns1=0 ; number of unknowns around initial square
        mines1=0 ; number of known mines around initial square
        jj:=j-2
        Loop 3 {
          jj++
          if(jj>0 and jj<=JMax){
            ii:=i-2
            Loop 3 {
              ii++
              if(ii>0 and ii<=IMax){
                if(square[ii,jj]=-4)
                  mines1++
                else if(square[ii,jj]=-1){
                  ; don't have to check for i=ii and j=jj because square[i,j] is never -1
                  ; MsgBox counting square %ii%, %jj%
                  unknowns1++
                  square[ii,jj]:=-5
                  partials[unknowns1,1]:=ii
                  partials[unknowns1,2]:=jj
                  grid[ii-i,jj-j]:=0
                  if(ii>=i and i>2){
                    jjj=-3
                    Loop 5 {
                      jjj++
                      grid[-2,jjj]:=0
                    }
                    ; ReportGrid()
                  }
                  if(ii>i and i>1){
                    jjj=-3
                    Loop 5 {
                      jjj++
                      grid[-1,jjj]:=0
                    }
                    ; ReportGrid()
                  }
                  if(ii<i and i<IMax){
                    jjj=-3
                    Loop 5 {
                      jjj++
                      grid[1,jjj]:=0
                    }
                    ; ReportGrid()
                  }
                  if(ii<=i and i<IMax-1){
                    jjj=-3
                    Loop 5 {
                      jjj++
                      grid[2,jjj]:=0
                    }
                    ; ReportGrid()
                  }
                  if(jj>=j and j>2){
                    iii=-3
                    Loop 5 {
                      iii++
                      grid[iii,-2]:=0
                    }
                    ; ReportGrid()
                  }
                  if(jj>j and j>1){
                    iii=-3
                    Loop 5 {
                      iii++
                      grid[iii,-1]:=0
                    }
                    ; ReportGrid()
                  }
                  if(jj<j and j<JMax){
                    iii=-3
                    Loop 5 {
                      iii++
                      grid[iii,1]:=0
                    }
                    ; ReportGrid()
                  }
                  if(jj<=j and j<JMax-1){
                    iii=-3
                    Loop 5 {
                      iii++
                      grid[iii,2]:=0
                    }
                    ; ReportGrid()
                  }
                }
              }
            }
          }
        }
        ; MsgBox counted %unknowns1% possibles
        ; ReportGrid()
        jjj=-3
        Loop 5 {
          jjj++
          iii=-3
          Loop 5 {
            iii++
            if(grid[iii,jjj]=1 and square[i+iii,j+jjj]>0){
              a:=i+iii
              b:=j+jjj
              ; MsgBox Checking %i%, %j% -> %a%, %b%
              SquareChanged=0
              unknowns2=0 ; number of extra unknowns around second square
              mines2=0 ; number of known mines around second square
              jj:=j+jjj-2
              Loop 3 {
                jj++
                if(jj>0 and jj<=JMax){
                  ii:=i+iii-2
                  Loop 3 {
                    ii++
                    if(ii>0 and ii<=IMax){
                      if(square[ii,jj]=-1){
                        unknowns2++
                        SquareChanged=1
                      }else if(square[ii,jj]=-4)
                        mines2++
                    }
                  }
                }
              }
              if(SquareChanged=1){
                if(square[i+iii,j+jjj]-square[i,j]+mines1-mines2=0){
                  ; MsgBox %i%, %j% -> %a%, %b% is cleared`ncount=%count%
                  jj:=j+jjj-2
                  Loop 3 {
                    jj++
                    if(jj>0 and jj<=JMax){
                      ii:=i+iii-2
                      Loop 3 {
                        ii++
                        if(ii>0 and ii<=IMax and square[ii,jj]=-1){
                          square[ii,jj]:=-2
                          ; MsgBox %ii%, %jj% is clear
                          BoardChanged=1
                        }
                      }
                    }
                  }
                }
                else if(square[i+iii,j+jjj]-square[i,j]+mines1-mines2=unknowns2){
                  jj:=j+jjj-2
                  Loop 3 {
                    jj++
                    if(jj>0 and jj<=JMax){
                      ii:=i+iii-2
                      Loop 3 {
                        ii++
                        if(ii>0 and ii<=IMax and square[ii,jj]=-1){
                          square[ii,jj]:=-4
                          ; MsgBox %ii%, %jj% is a mine
                          BoardChanged=1
                        }
                      }
                    }
                  }
                }
              }                
            }
          }
        }
        n=0
        Loop %unknowns1% {
          n++
          square[partials[n,1],partials[n,2]]:=-1
        }
      }
    }
  }
}

ClickBoard(){
  global
  if(GameOver=0){
    if(BoardChanged=1){
      y:=y1
      j=0
      Loop %JMax% {
        y+=16
        j++
        x:=x1
        i=0
        Loop %IMax% {
          x+=16
          i++
          if(square[i,j]=-2){ ; if square needs to be clicked
            square[i,j]:=-1 ; change back to unknown so UpdateBoard will read it next time
            PixelGetColor color, x-8, y-2
            if(color=0xFFFFFF){ ; if square hasn't already been uncovered
              MouseMove x-1, y+4, 0
              ; MsgBox clicking square %i%, %j% at location %x%, %y%
              Click
            }
          }
        }
      }
    }else{
      n=0
      j=0
      Loop %JMax% {
        j++
        i=0
        Loop %IMax% {
          i++
          if(square[i,j]=-1){
            n++
            guesses[n,1]:=x1+16*i
            guesses[n,2]:=y1+16*j
          }
        }
      }
      if(n>0){
        Random g, 1, n
        MouseMove guesses[g,1], guesses[g,2], 0
        Click
      }else
        GameOver=1
    }
  }
  if(GameOver=0){
    UpdateBoard()
    Strategize1()
    ClickBoard()
  }else{
    Sleep 500
    SendInput 3
    NewGame()
    Play()
  }
}

ReportGrid(){
  global
  g88:=grid[-2,-2]
  g98:=grid[-1,-2]
  g08:=grid[0,-2]
  g18:=grid[1,-2]
  g28:=grid[2,-2]
  g89:=grid[-2,-1]
  g99:=grid[-1,-1]
  g09:=grid[0,-1]
  g19:=grid[1,-1]
  g29:=grid[2,-1]
  g80:=grid[-2,0]
  g90:=grid[-1,0]
  g00:=grid[0,0]
  g10:=grid[1,0]
  g20:=grid[2,0]
  g81:=grid[-2,1]
  g91:=grid[-1,1]
  g01:=grid[0,1]
  g11:=grid[1,1]
  g21:=grid[2,1]
  g82:=grid[-2,2]
  g92:=grid[-1,2]
  g02:=grid[0,2]
  g12:=grid[1,2]
  g22:=grid[2,2]
  MsgBox %g88% %g98% %g08% %g18% %g28%`n%g89% %g99% %g09% %g19% %g29%`n%g80% %g90% %g00% %g10% %g20%`n%g81% %g91% %g01% %g11% %g21%`n%g82% %g92% %g02% %g12% %g22%
}