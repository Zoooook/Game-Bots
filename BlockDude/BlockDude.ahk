Delay=50

s:=""

^r::Reload
Esc::Suspend

; z::Level7WalkLeft()
; x::Level7CarryRight()
; c::Level7CarryLeft()
; v::Level7WalkRight()
; b::Level11CarryLeft()
; m::Level11WalkRight()

; ~Left::s.="l"
; ~Right::s.="r"
; ~Up::s.="u"
; ~Down::s.="d"

Left(x=1){
  global Delay
  Loop %x% {
    SendInput {Left}
    Sleep %Delay%
  }
}
Right(x=1){
  global Delay
  Loop %x% {
    SendInput {Right}
    Sleep %Delay%
  }
}
Up(x=1){
  global Delay
  Loop %x% {
    SendInput {Up}
    Sleep %Delay%
  }
}
Down(x=1){
  global Delay
  Loop %x% {
    SendInput {Down}
    Sleep %Delay%
  }
}

; RAlt::
;   t:=""
;   i=1
;   Loop Parse, s
;   {
;     if(t==A_LoopField){
;       i++
;     }else if(A_Index>1){
;       if(t=="l")
;         SendInput {Space 2}Left+9
;       else if(t=="r")
;         SendInput {Space 2}Right+9
;       else if(t=="u")
;         SendInput {Space 2}Up+9
;       else if(t=="d")
;         SendInput {Space 2}Down+9
;       if(i>1)
;         SendInput %i%
;       SendInput +0{Enter}
;       i=1
;     }
;     t=%A_LoopField%
;   }
;   if(t!=""){
;     if(t=="l")
;       SendInput {Space 2}Left+9
;     else if(t=="r")
;       SendInput {Space 2}Right+9
;     else if(t=="u")
;       SendInput {Space 2}Up+9
;     else if(t=="d")
;       SendInput {Space 2}Down+9
;     if(i>1)
;       SendInput %i%
;     SendInput +0{Enter}
;   }
; return

Level7CarryRight(){
  Right()
  Up(3)
  Right(3)
  Down()
  Left()
  Up()
  Down()
  Right()
  Down()
  Left()
  Down()
  Left()
  Up()
  Right()
  Down()
  Left()
  Down()
  Right()
  Up(3)
}
Level7WalkLeft(){
  Left(2)
  Right()
  Down()
  Left()
  Down()
  Right()
  Down()
  Left()
  Down()
  Right()
  Down()
  Right()
  Left()
  Down()
  Up(3)
  Left(4)
}
Level7CarryLeft(){
  Left(3)
  Down()
  Right()
  Up()
  Down()
  Left()
  Down()
  Right()
  Down()
  Right()
  Up()
  Left()
  Down()
  Right()
  Down()
  Left()
  Up(3)
  Left(5)
}
Level7WalkRight(){
  Right(2)
  Up(3)
  Right(2)
  Left()
  Down()
  Right()
  Down()
  Left()
  Down()
  Right()
  Down()
  Left()
  Down()
  Left()
  Right()
  Down()
  Up(3)
}
Level11CarryLeft(){
  Up(2)
  Left(3)
  Down()
  Right()
  Up()
  Down()
  Left()
  Down()
  Right()
  Down()
  Right()
  Up()
  Left()
  Down()
  Right()
  Down()
  Left()
  Up(3)
}
Level11WalkRight(){
  Right(2)
  Left()
  Down()
  Right()
  Down()
  Left()
  Down()
  Right()
  Down()
  Left()
  Down()
  Left()
  Right()
  Down()
  Up(3)
  Right(4)
}

!1::
  Left()
  Down()
  Left()
  Down()
  Up(2)
  Left()
  Down()
  Left(2)
  Up()
  Left(2)
  Down()
  Up(2)
  Left(3)
return

!2::
  Left()
  Up()
  Down()
  Left(2)
  Up(2)
  Down()
  Right(2)
  Down()
  Left()
  Up(2)
  Left(6)
  Down()
  Right()
  Up(2)
  Right(2)
  Up(2)
  Right(3)
  Down()
  Left()
  Up(2)
  Left(6)
  Up(2)
  Left(2)
  Down()
  Right(4)
  Up(2)
  Right(2)
  Down()
  Left(4)
  Up(2)
  Left()
  Down()
  Right(3)
  Down()
  Left()
  Up(2)
  Left()
  Up()
  Down()
  Up(2)
return

!3::
  Left(2)
  Down()
  Right()
  Up(2)
  Down()
  Left(3)
  Down()
  Right()
  Up(2)
  Right()
  Down()
  Up(3)
  Right(2)
  Left()
  Down()
  Left()
  Up()
  Right()
  Down()
  Up(2)
  Down()
  Left(2)
  Up()
  Left(2)
  Down()
  Right()
  Up(2)
  Right()
  Up()
  Down()
  Left()
  Up()
  Left(3)
  Up()
  Left(3)
  Down()
  Right()
  Up(2)
  Right(2)
  Up(2)
  Right()
  Up()
  Right()
  Down()
  Left(2)
  Up()
  Left(3)
  Up()
  Left(2)
  Down()
  Right()
  Up(2)
  Right(2)
  Up(2)
  Right()
  Down()
  Left()
  Up()
  Left(3)
  Up()
  Left(2)
  Up()
  Down()
  Up(2)
  Left(3)
return

!4::
  Left(3)
  Up()
  Down()
  Left(2)
  Up()
  Down()
  Right()
  Up()
  Right(2)
  Left()
  Down()
  Left()
  Up()
  Left()
  Up()
  Down()
  Up()
  Down()
  Right(2)
  Up()
  Right()
  Down()
  Left()
  Up()
  Left()
  Up()
  Down()
  Right()
  Up()
  Right()
  Up(2)
  Down()
  Left(2)
  Up()
  Left()
  Up()
  Left()
  Down()
  Right(2)
  Up()
  Right()
  Up(4)
  Right(2)
  Down()
  Left()
  Up()
  Left(4)
  Up()
  Left()
  Up()
  Left(3)
  Right()
  Down()
  Right()
  Up()
  Right(2)
  Up()
  Right()
  Up(4)
  Right()
  Down()
  Left()
  Up()
  Left(4)
  Up()
  Left()
  Up()
  Left(2)
  Right()
  Down()
  Right()
  Up()
  Right()
  Up()
  Right()
  Up(4)
  Right()
  Up()
  Down()
  Up(2)
  Down()
  Left(3)
  Up()
  Left(4)
  Up()
  Left()
  Up()
  Left(2)
  Down()
  Right()
  Up()
  Right()
  Up()
  Right()
  Up(4)
  Right()
  Up(2)
  Down()
  Left(2)
  Up()
  Left(4)
  Up()
  Left()
  Up()
  Left()
  Down()
  Right()
  Up()
  Right()
  Up()
  Right()
  Up(4)
  Right()
  Up(2)
  Right()
  Down()
  Left(3)
  Up()
  Left(4)
  Up()
  Left()
  Up()
  Left()
  Up()
  Down()
  Right()
  Up()
  Right()
  Up()
  Right()
  Up(4)
  Right()
  Up()
  Down()
  Left()
  Up()
  Left(4)
  Up()
  Left()
  Up()
  Down()
  Right()
  Up()
  Right()
  Up(4)
  Right()
  Down()
  Left()
  Up()
  Left(4)
  Up()
  Left()
  Up()
  Left()
  Down()
  Right(2)
  Up()
  Right()
  Up(4)
  Right(2)
  Down()
  Left()
  Up()
  Left(4)
  Up()
  Left()
  Up()
  Left()
  Up()
  Down()
  Right(3)
  Up()
  Right()
  Up(2)
  Down()
  Left(2)
  Up()
  Left()
  Up()
  Left()
  Up(3)
  Down()
  Right(5)
  Up()
  Right()
  Down()
  Left()
  Up()
  Left()
  Up()
  Left()
  Up(3)
  Down()
  Left()
  Up()
  Left(3)
return

!5::
  Left()
  Up()
  Down()
  Right()
  Down()
  Left()
  Up()
  Left()
  Down()
  Right(2)
  Down()
  Left()
  Up()
  Left(2)
  Down()
  Right(3)
  Down()
  Right()
  Up()
  Right(3)
  Up(2)
  Down()
  Left(2)
  Down()
  Right()
  Up()
  Down()
  Left()
  Up(3)
  Left()
  Up(2)
  Left(2)
  Down()
  Right(4)
  Up()
  Right(3)
  Up()
  Right()
  Down()
  Left(2)
  Up(3)
  Left()
  Up(2)
  Left(2)
  Up()
  Down()
  Right(5)
  Up()
  Right(3)
  Down()
  Left()
  Up(3)
  Left()
  Up(2)
  Left(2)
  Up(3)
  Down()
  Right(7)
  Up()
  Right(4)
  Down()
  Left()
  Up(3)
  Left()
  Up(2)
  Left(2)
  Up(3)
  Left()
  Down()
  Left()
  Right()
  Down()
  Left()
  Down()
  Right()
  Down()
  Right()
  Left()
  Down()
  Left()
  Up()
return

!6::
  Up()
  Down()
  Right(2)
  Down()
  Left(3)
  Right()
  Down()
  Right()
  Up()
  Right()
  Down()
  Left(2)
  Right()
  Down()
  Right()
  Up()
  Down()
  Up()
  Down()
  Left(3)
  Down()
  Right()
  Up(2)
  Right()
  Down()
  Left(4)
  Up(2)
  Down()
  Right(3)
  Up()
  Down()
  Left(2)
  Up(2)
  Down()
  Right(3)
  Down()
  Left()
  Up(2)
  Left()
  Down()
  Right()
  Up()
  Right(4)
  Down()
  Left(2)
  Up(2)
  Left(2)
  Down()
  Right()
  Down()
  Left()
  Down()
  Right()
  Down()
  Left()
  Down()
  Right()
  Up()
  Right()
  Down()
  Left(3)
  Down()
  Right()
  Up()
  Down()
  Left()
  Down()
  Right()
  Down()
  Right()
  Up()
  Left()
  Down()
  Right()
  Down()
  Left()
  Up(5)
  Down()
  Up(2)
return

!7::
  Left()
  Down()
  Left()
  Right()
  Down()
  Left(2)
  Right()
  Down()
  Right()
  Up()
  Left()
  Down()
  Right()
  Up()
  Down()
  Left()
  Down()
  Right()
  Down()
  Right()
  Up()
  Left()
  Down()
  Right()
  Down()
  Left()
  Up(3)
  Left(2)
  Up(2)
  Down()
  Up()
  Down()
  Left()
  Down()
  Left()
  Right()
  Down()
  Right()
  Up()
  Left()
  Down()
  Right()
  Down()
  Left()
  Down()
  Right(3)
  Left()
  Down()
  Left()
  Up()
  Down()
  Up(2)
  Down()
  Right(4)
  Down()
  Left()
  Up(2)
  Down()
  Right(3)
  Down()
  Left()
  Up()
  Down()
  Right()
  Level7CarryRight()
  Right()
  Down()
  Left()
  Level7WalkLeft()
  Up()
  Left()
  Down()
  Right(2)
  Level7CarryRight()
  Right()
  Down()
  Left()
  Level7WalkLeft()
  Down()
  Level7CarryRight()
  Down()
  Level7WalkLeft()
  Left()
  Down()
  Right()
  Level7CarryRight()
  Up()
  Down()
  Left()
  Level7WalkLeft()
  Left(2)
  Down()
  Right(2)
  Level7CarryRight()
  Up(2)
  Down()
  Up()
  Down()
  Left(3)
  Level7CarryLeft()
  Left()
  Down()
  Right()
  Level7WalkRight()
  Up(2)
  Down()
  Left(2)
  Level7CarryLeft()
  Down()
  Level7WalkRight()
  Up(2)
  Right()
  Down()
  Left(3)
  Level7CarryLeft()
  Up()
  Down()
  Right()
  Level7WalkRight()
  Up()
  Down()
  Left()
  Level7CarryLeft()
  Up(3)
  Down()
  Right(3)
  Level7WalkRight()
  Up()
  Right()
  Down()
  Left(2)
  Level7CarryLeft()
  Up(3)
  Down()
  Right(3)
  Level7WalkRight()
  Up()
  Right(2)
  Down()
  Left(3)
  Level7CarryLeft()
  Up(3)
  Down()
  Right(3)
  Level7WalkRight()
  Down()
  Level7CarryLeft()
  Up(3)
  Down()
  Right(3)
  Level7WalkRight()
  Right()
  Down()
  Left()
  Level7CarryLeft()
  Up(3)
  Left()
  Down()
  Right()
  Up()
  Right(5)
  Down()
  Left(2)
  Up(3)
  Left()
  Down()
  Left()
  Right()
  Down()
  Right()
  Left()
  Down()
  Up(2)
return

!8::
  Right(2)
  Up(2)
  Down()
  Left(5)
  Down()
  Right(3)
  Up()
  Down()
  Left(3)
  Down()
  Right(2)
  Up()
  Right()
  Down()
  Left(3)
  Down()
  Right()
  Down()
  Left()
  Up()
  Left(3)
  Down()
  Right(6)
  Down()
  Left(2)
  Up()
  Left(4)
  Down()
  Right(8)
  Down()
  Left(3)
  Up()
  Left(4)
  Down()
  Up(2)
  Down()
  Right(5)
  Down()
  Left(3)
  Down()
  Right(2)
  Down()
  Left(8)
  Down()
  Left(2)
  Down()
  Up(2)
  Down()
  Right(8)
  Up()
  Right(2)
  Down()
  Left(9)
  Down()
  Right(6)
  Up()
  Right(2)
  Up()
  Right()
  Down()
  Left(5)
  Right()
  Down()
  Right()
  Up()
  Right()
  Up()
  Down()
  Left(3)
  Right()
  Down()
  Right()
  Up(3)
  Down()
  Up(2)
  Right(2)
  Up()
  Down()
  Left(7)
  Down()
  Right()
  Up(4)
  Right(2)
  Down()
  Left(7)
  Down()
  Right()
  Up(4)
  Right(3)
  Down()
  Left(8)
  Down()
  Right()
  Up(2)
  Down()
  Left(3)
  Down()
  Right()
  Up()
  Down()
  Left()
  Down()
  Right()
  Down()
  Left()
  Up(2)
  Down()
  Right(3)
  Up()
  Down()
  Left(2)
  Up(3)
  Down()
  Right(4)
  Down()
  Left()
  Up(3)
  Down()
  Right(5)
  Down()
  Left(2)
  Up(4)
  Down()
  Right(8)
  Left()
  Down()
  Left()
  Up()
  Left(2)
  Up(4)
  Down()
  Right(7)
  Left()
  Down()
  Left()
  Up()
  Left()
  Up(4)
  Down()
  Up(4)
  Left()
  Down()
  Left(2)
  Down()
  Right()
  Down()
  Left()
  Down()
  Right()
  Up(2)
  Right(10)
  Left()
  Down()
  Left()
  Up(9)
  Left(2)
  Down()
  Up(2)
  Up(3)
  Down()
  Right(5)
  Up(2)
  Right(3)
  Down()
  Left()
  Up(3)
  Left(2)
  Up(4)
  Down()
  Right(4)
  Up(2)
  Right(4)
  Down()
  Left()
  Up(3)
  Left(2)
  Up(4)
  Left()
  Down()
  Right(5)
  Up(2)
  Right(4)
  Down()
  Left()
  Up(3)
  Left(2)
  Up()
  Down()
  Right()
  Up(2)
  Right(4)
  Down()
  Left()
  Up(3)
  Left(2)
  Down()
  Right()
  Up(2)
  Right(4)
  Up(4)
  Right()
  Down()
  Left(6)
  Up(3)
  Left(3)
  Down()
  Right()
  Up(2)
  Right(4)
  Up(4)
  Right()
  Down()
  Up(3)
  Right(3)
return

!9::
  Left(2)
  Up()
  Left(2)
  Down()
  Left()
  Right()
  Down()
  Up(2)
  Right(2)
  Up(3)
  Right()
  Down()
  Right()
  Left()
  Down()
  Up(2)
  Down()
  Left(2)
  Right()
  Down()
  Up(3)
  Down()
  Left(2)
  Down()
  Right()
  Up()
  Down()
  Left(2)
  Down()
  Right()
  Up()
  Right()
  Down()
  Left(3)
  Down()
  Up(3)
  Down()
  Left()
  Down()
  Right(2)
  Left()
  Down()
  Left()
  Up()
  Down()
  Right()
  Left()
  Down()
  Right(3)
  Down()
  Left()
  Down()
  Right()
  Up()
  Down()
  Left(3)
  Up()
  Left()
  Down()
  Right()
  Up()
  Down()
  Left(3)
  Right()
  Down()
  Right()
  Up(2)
  Down()
  Up()
  Down()
  Left(3)
  Down()
  Right()
  Up(3)
  Right()
  Up(2)
  Down()
  Left(6)
  Up(2)
  Left()
  Down()
  Right(3)
  Up(3)
  Right()
  Up()
  Down()
  Left(5)
  Up(2)
  Left()
  Down()
  Right(3)
  Up(3)
  Right()
  Down()
  Left(4)
  Up(2)
  Left()
  Down()
  Right(3)
  Up(3)
  Right(2)
  Down()
  Left(5)
  Up(2)
  Left(2)
  Down()
  Right()
  Up()
  Right(3)
  Up(2)
  Down()
  Left(2)
  Up(2)
  Left(2)
  Down()
  Right()
  Up()
  Right(3)
  Down()
  Left()
  Up(2)
  Left(2)
  Down()
  Left()
  Right()
  Down()
  Left()
  Down()
  Right()
  Down()
  Left()
  Down()
  Right()
  Down()
  Right()
  Left()
  Down()
  Up(3)
return

!0::
  Left(8)
  Up()
  Down()
  Right(2)
  Up(2)
  Right()
  Down()
  Left(4)
  Down()
  Right()
  Up(2)
  Right()
  Up(4)
  Down()
  Left(9)
  Down()
  Right(2)
  Up(2)
  Right()
  Up(4)
  Right(2)
  Down()
  Up()
  Right(4)
  Up(2)
  Down()
  Left(2)
  Up(2)
  Down()
  Right(2)
  Up()
  Down()
  Left()
  Up(3)
  Left(2)
  Right()
  Up()
  Down()
  Left()
  Down()
  Right()
  Up(3)
  Right(2)
  Down()
  Left(6)
  Down()
  Right()
  Up(3)
  Right()
  Down()
  Left(3)
  Right()
  Down()
  Left()
  Down()
  Right()
  Up()
  Right(4)
  Up()
  Right()
  Down()
  Left(2)
  Up(3)
  Left()
  Down()
  Right(4)
  Down()
  Left()
  Up(3)
  Left(2)
  Down()
  Right(6)
  Down()
  Left()
  Up(3)
  Left()
  Down()
  Right(6)
  Down()
  Left(2)
  Up(3)
  Left()
  Up()
  Right()
  Down()
  Left()
  Down()
  Right()
  Up(2)
  Down()
  Left(3)
  Down()
  Right()
  Up(3)
  Down()
  Left(6)
  Right()
  Down()
  Right()
  Up()
  Right()
  Up(5)
  Down()
  Left(7)
  Right()
  Down()
  Right()
  Up(5)
  Left()
  Down()
  Right()
  Up(2)
  Down()
  Left(2)
  Down()
  Right()
  Down()
  Left()
  Down()
  Right(3)
  Left()
  Down()
  Left()
  Up()
  Down()
  Up(6)
  Left()
  Down()
  Left()
  Right()
  Down()
  Left()
  Down()
  Left()
  Right()
  Down()
  Left()
  Down()
  Left()
  Up()
  Left()
  Up(2)
  Down()
  Right(6)
  Down()
  Left(2)
  Up()
  Left()
  Up(2)
  Down()
  Right(7)
  Down()
  Left(3)
  Up()
  Left()
  Up()
  Right()
  Down()
  Up(2)
  Down()
  Left(2)
  Up(2)
  Down()
  Right(2)
  Up(2)
  Right()
  Down()
  Left(3)
  Up(2)
  Down()
  Right(2)
  Down()
  Left()
  Up(2)
  Left()
  Right()
  Down()
  Left()
  Down()
  Left()
  Down()
  Right(2)
  Left()
  Down()
  Left()
  Up()
  Down()
  Left()
  Right()
  Down()
  Left(2)
  Down()
  Right()
  Down()
  Left()
  Down()
  Right(2)
  Down()
  Left()
  Down()
  Up(3)
return

!-::
  Left()
  Right()
  Left()
  Down(2)
  Left(4)
  Right()
  Down()
  Left(2)
  Down()
  Right(3)
  Down()
  Left(2)
  Down()
  Right(3)
  Down()
  Left(3)
  Up()
  Down()
  Up()
  Down()
  Right()
  Down()
  Left()
  Down()
  Left(2)
  Down()
  Right()
  Down()
  Right()
  Up()
  Left()
  Down()
  Up(4)
  Down()
  Right(4)
  Up()
  Down()
  Left()
  Up(3)
  Down()
  Right(3)
  Up(4)
  Down()
  Left(4)
  Up(3)
  Left()
  Down()
  Right(4)
  Up(5)
  Down()
  Left(5)
  Up()
  Down()
  Right()
  Up(5)
  Down()
  Left(5)
  Down()
  Right()
  Up(7)
  Right()
  Up(3)
  Down()
  Left()
  Right()
  Down(2)
  Left(2)
  Up()
  Left(8)
  Down()
  Right()
  Up(7)
  Right()
  Up(2)
  Right(2)
  Down()
  Left()
  Down()
  Right()
  Down()
  Up(2)
  Right()
  Up()
  Right(5)
  Left()
  Down()
  Left(3)
  Down()
  Left()
  Right(4)
  Left(3)
  Up()
  Left(2)
  Down()
  Left()
  Right()
  Up()
  Down()
  Up(2)
  Down()
  Left(3)
  Down()
  Right()
  Up(3)
  Right()
  Down()
  Left(4)
  Up(2)
  Left()
  Down()
  Right(3)
  Up()
  Down()
  Left()
  Up(2)
  Down()
  Right(2)
  Down()
  Left()
  Up(3)
  Down()
  Up()
  Down()
  Right()
  Down()
  Left()
  Down()
  Left()
  Right()
  Down()
  Left()
  Down(2)
  Right()
  Up()
  Down()
  Left(2)
  Down()
  Right()
  Down()
  Left(2)
  Down()
  Right()
  Down()
  Left()
  Down()
  Right()
  Up()
  Right()
  Down()
  Left(2)
  Down()
  Right()
  Down()
  Left()
  Up(2)
  Down()
  Right(3)
  Up()
  Right()
  Down()
  Left(3)
  Up(2)
  Down()
  Right(3)
  Down(2)
  Right()
  Down(2)
  Right()
  Down()
  Left(3)
  Up(2)
  Left()
  Down()
  Right()
  Up()
  Right(6)
  Down()
  Left()
  Up()
  Left(3)
  Level11CarryLeft()
  Down()
  Level11WalkRight()
  Right(5)
  Down()
  Left(3)
  Up()
  Left(3)
  Level11CarryLeft()
  Left(2)
  Down()
  Right()
  Up()
  Level11WalkRight()
  Right(6)
  Down()
  Left(4)
  Up()
  Left(3)
  Level11CarryLeft()
  Left(2)
  Up(2)
  Left()
  Down()
  Right(4)
  Up()
  Level11WalkRight()
  Right(2)
  Left()
  Down()
  Left()
  Up()
  Left(2)
  Level11CarryLeft()
  Left(2)
  Up(2)
  Down()
  Right(3)
  Up()
  Level11WalkRight()
  Right()
  Left()
  Down()
  Left()
  Up()
  Left()
  Level11CarryLeft()
  Left(2)
  Up(3)
  Down()
  Right(4)
  Up()
  Level11WalkRight()
  Left()
  Down()
  Left()
  Up()
  Level11CarryLeft()
  Left(2)
  Up(3)
  Right()
  Down()
  Left()
  Up()
  Down()
  Right()
  Down()
  Left()
  Down()
  Right()
  Up(2)
  Right()
  Up(7)
  Right()
  Up()
  Down()
  Left()
  Up()
  Left(11)
  Down()
  Right()
  Up(2)
  Right()
  Up(7)
  Right()
  Left()
  Up()
  Down()
  Right()
  Up()
  Right()
  Up()
  Right()
  Down()
  Left(2)
  Down()
  Right()
  Down()
  Right()
  Up()
  Left()
  Down()
  Right()
  Down()
  Right()
  Up()
  Left()
  Down()
  Right()
  Down()
  Right()
  Down()
  Left()
  Down()
  Right(2)
  Down()
  Left()
  Up()
  Down()
  Right()
  Up(2)
  Down()
  Left(2)
  Down()
  Right()
  Up(3)
  Left()
  Down()
  Right()
  Down()
  Right()
  Left()
  Down()
  Up(2)
  Left(2)
  Up()
  Down()
  Left(2)
  Up()
  Down()
  Up(2)
  Left()
  Down()
  Right(4)
  Up()
  Right(5)
  Down()
  Left()
  Up()
  Left(2)
  Up()
  Left(2)
  Up(3)
  Left(2)
  Down()
  Right(5)
  Up()
  Right(6)
  Down()
  Left()
  Up()
  Left(2)
  Down()
  Right(4)
  Down()
  Left()
  Up()
  Left(3)
  Down()
  Right(5)
  Up()
  Down()
  Up(2)
return