#power analysis
set ckt_name "cmos_inv"
#common constants
set e 2.71828
set p 1e-12
set u 1e-6
set n 1e-9 
#inputs to ckt
set VDD 3.3
set CL 10e-12
# set in1_period 1e-6 
# set in2_period 2e-6
# set out_period 4e-6

set clk_period 2e-6
#thermal equivalent voltage VT
set K 1.38e-23
set q 1.602e-19
set temp_cel 27
set temp_kelvin [expr $temp_cel + 273.15]
set Vtherm [expr $K*$temp_kelvin/$q]

set inputs_num 1
set max_poss [expr 2**$inputs_num]
#finding input frequency
set f [expr 1.0/$clk_period]

set onprob [expr 1.0/$max_poss]
set offprob [expr 1 - $onprob]
#taking input on and off probabilities into arrays
#set i 0
  for {set i 0} {$i < $inputs_num} {incr i} {
	  set in_onprob($i) $onprob
	  set in_offprob($i) $offprob
  }
set j 0  

set alpha [expr ($in_onprob($j))*($in_offprob($j))]
#switching power
set PT [expr $VDD*$CL*$VDD*$f*$alpha]
puts "Expected switching power in watt of $ckt_name is $PT"

#leakage power
set IS 1e-14
set kp 2e-5
set W 0.1e-6
set L 0.18e-6 
set aspect_ratio [expr $W/$L]
set Ijunc [expr $kp*$aspect_ratio*($e**1.8)*($Vtherm**2)]
set Ilkg [expr $IS*(($e**$Vtherm)-1)]
set Icc [expr $Ijunc + $Ilkg]
set PS [expr $Icc*$VDD]
puts "Expected Leakage power in watt of $ckt_name is $PS" 





