# (C)FRANCO RONDINI 2017.
#
# title          : xor03b.bas
# description    : TESTING PERFORMANCE IN ZX SPECTRUM XOR METHODS
# author         : Franco Rondini (c) 2017
# date           : 20170923
# version        : 1.0.0  
# note           : x(a,b)=(NOT NOT a <> NOT NOT b) - without FN
#                : performs in 0.22 sec. x256: 22.02 sec. 
#                              0.22 sec. x256: 21.58 sec.(without parenthesis)
# ============================================================================
   2 CLS : PRINT TAB 5;"XOR TESTING: 03b"
   3 PRINT " NOT NOT a <> NOT NOT b "
   4 PRINT "--------------------------------"
   5 DEF FN t()=((65536*PEEK 23674+256*PEEK 23673+ PEEK 23672)/50)
   7 REM DEF FN x(a,b)=(NOT NOT a <> NOT NOT b)
   9 LET t1=FN t()
  10 FOR a=0 TO 1 : REM left operand
  20 FOR b=0 TO 1 : REM right operand
  30 LET r=NOT NOT a <> NOT NOT b : REM compute xor
  40 PRINT "a:";a;" b:";b;" => ";r
  50 NEXT b
  60 NEXT a 
  65 LET t2=FN t()
  69 PRINT "time taken in seconds:";t2-t1

 100 FOR i=0 TO 255 
 110 FOR a=0 TO 1 : REM left operand
 120 FOR b=0 TO 1 : REM right operand
 130 LET r=NOT NOT a <> NOT NOT b : REM compute xor
 150 NEXT b
 160 NEXT a 
 165 NEXT i
 166 LET t3=FN t()
 169 PRINT "time taken for 4096 ..:";t3-t2