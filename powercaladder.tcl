#power analysis
set ckt_name "4-bit adder"
#common constants
set e 2.71828
set p 1e-12
set u 1e-6
set n 1e-9 
#inputs to ckt
# digital voltage levels set to 5 by default
set VDD 5
set CL 10e-15

set fan_in 9
set fan_out 5
set clk_period 2e-3
#thermal equivalent voltage VT
set K 1.38e-23
set q 1.602e-19
set temp_cel 27
set temp_kelvin [expr $temp_cel + 273.15]
set Vtherm [expr $K*$temp_kelvin/$q]

set inputs_num 9
set max_poss [expr 2**$inputs_num]
#finding clk frequency
set f [expr 1.0/$clk_period]

#finding switching activity
#input frequencies
set fin(0) 1e+3
set fin(1) 8e+3
set fin(2) 2e+3
set fin(3) 4e+3
set fin(4) 1e+3
set fin(5) 2e+3
set fin(6) 1e+3
set fin(7) 2e+3
set fin(8) 1e+3 

#taking input on and off probabilities into arrays
#set i 0
  for {set i 0} {$i < $inputs_num} {incr i} {
	  set in_onprob($i) [expr $f/$fin($i)]
	  set in_offprob($i) [expr 1- $in_onprob($i)]
  }
 #average internal fanout 
 set avg_int_fanout 5
#no.of stages in gate level ckt
set num_stage 5  
 
set sum 0
  for {set i 0} {$i < $inputs_num} {incr i} {
	  set dummyalpha [expr ($in_onprob($i))*($in_offprob($i)* $avg_int_fanout)*$num_stage ]
	  set sum [expr $dummyalpha + $sum]
  }
  
  set alpha $sum
#switching power
set PT [expr $VDD*$CL*$VDD*$f*$alpha*$fan_out]
puts "Expected switching power in watt of $ckt_name is $PT"





