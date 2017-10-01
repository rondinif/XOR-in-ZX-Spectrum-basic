# (C)FRANCO RONDINI 2017.
#
# title          : xor06b.bas
# description    : TESTING PERFORMANCE IN ZX SPECTRUM XOR METHODS
# author         : Franco Rondini (c) 2017
# date           : 20170923
# version        : 1.0.0  
# note           : NOT(A AND B) AND (A OR B)
#                : performs in 0.20 sec. x256: 23.48 sec. 
# ============================================================================
   2 CLS : PRINT TAB 5;"XOR TESTING: 06b"
   3 PRINT " NOT(A AND B) AND (A OR B) ..w/o FN"
   4 PRINT "--------------------------------"
   5 DEF FN t()=((65536*PEEK 23674+256*PEEK 23673+ PEEK 23672)/50)
   7 REM DEF FN x(a,b)=(NOT(a AND b) AND (a OR b))
   9 LET t1=FN t()
  10 FOR a=0 TO 1 : REM left operand
  20 FOR b=0 TO 1 : REM right operand
  30 LET r=(NOT(a AND b) AND (a OR b)) : REM compute xor
  40 PRINT "a:";a;" b:";b;" => ";r
  50 NEXT b
  60 NEXT a 
  65 LET t2=FN t()
  69 PRINT "time taken in seconds:";t2-t1

 100 FOR i=0 TO 255 
 110 FOR a=0 TO 1 : REM left operand
 120 FOR b=0 TO 1 : REM right operand
 130 LET r=(NOT(a AND b) AND (a OR b)) : REM compute xor
 150 NEXT b
 160 NEXT a 
 165 NEXT i
 166 LET t3=FN t()
 169 PRINT "256 iterations:";t3-t2