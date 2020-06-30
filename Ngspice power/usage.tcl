# finding beta values

#common constants
set m 1e-3
set u 1e-6
set n 1e-9
set p 1e-12
set f 1e-15
set k 1e+3
#puts "\033\[34mG\033\[31mo\033\[33mo\033\[34mg\033\[32ml\033\[31me\033\[0m"

puts "\n \033\[92m**Valid only for single vdd circuits**\033\[0m"
puts "\033\[92m**Any node in netlist should not contain\033\[0m \033\[36mnet\033\[0m \033\[92mand\033\[0m \033\[36mnetl\033\[0m \033\[92mas node names**\033\[0m \n"

puts "\033\[33mEnter the VDD node\033\[0m"
set VDD_node [gets stdin]
puts "\033\[33mEnter the supply voltage name\033\[0m"
set VDD_name [gets stdin]
puts "\033\[33mEnter VDD value in volts\033\[0m"
set VDD [gets stdin]
puts "\033\[33mEnter the minimum time period of circuit in ns\033\[0m"
set T_ns [gets stdin]
set T_s [expr $T_ns*1e-9]

set Cy_max_nF [expr $T_ns/$VDD]
if {$Cy_max_nF >=1} {
set Cy_n [expr floor($Cy_max_nF)]
# puts $Cy_n
} else {
set Cy_n [expr $Cy_max_nF - 0.1]
# puts $Cy_n
}

set Cy [expr $Cy_n * 1e-9]
set Ry_k [format "%.3f" [expr 100*$Cy_n]]
set Ry  [expr 1000*$Ry_k ]

set Cy_n [format "%.3f" $Cy_n]
set beta [expr $Cy*$VDD/$T_s]
# puts $beta
set beta [format "%.3f" $beta]
# puts $beta

puts "\n\033\[93mReplace $VDD_node with net in overall netlist except supply initialization line like '$VDD_name $VDD_node $VDD 0Vdc' \033\[0m \n"

puts "\033\[93mEnter below lines within the netlist before simulaton analysis such as .tran, .op or .dc etc.\033\[0m" 
puts "\033\[93mAlso add uic to the analysis command like .tran 1n 20n uic\033\[0m \n" 
puts "\033\[96mVnet $VDD_node net 0\033\[0m"
puts "\033\[96mFnet 0 netl Vnet $beta\033\[0m"
puts "\033\[96mCnet netl 0 $Cy_n n\033\[0m "
puts "\033\[96mRnet netl 0 $Ry_k k\033\[0m"

puts "\n\033\[93mEnter below lines after .control and run statements\033\[0m \n"
puts "\033\[96mplot V(netl)\033\[0m"
puts "\n\033\[93mNow run the modified netlist using ngspice\033\[0m"

puts "\n\033\[93mFor each interval $T_s, the voltage step in V(netl) plot is average switching power.\033\[0m \n"

puts "\n\033\[93mFor leakage power, replace all analysis in netlist by .op and give all inputs to zero volt dc\033\[0m \n"
puts "\033\[96m print I(Vnet)*V($VDD_node)\033\[0m \n"
puts "\033\[93m This gives leakage power\033\[0m \n"
