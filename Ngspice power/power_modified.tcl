#Removing previous files
exec rm -f  "switchingpower_netlist.cir" "leakagepower_netlist.cir" "outtxtfile.txt" "leakage.txt"

#Generation of netlists
puts "\n\033\[32m**Valid only for single supply (VDD) circuits**\033\[0m "
puts "\033\[32m**.tran and run statements should be present in the netlist**\033\[0m"
puts "\033\[32m**Any node in netlist should not contain\033\[0m \033\[36mnet\033\[0m \033\[32mand\033\[0m \033\[36mnetl\033\[0m \033\[32mas node names**\033\[0m \n"

puts "\033\[33mEnter netlist file name with extension:\033\[0m"
set originalfile [gets stdin]
set filename [open $originalfile r]
set filecontent [read $filename]
set data $filecontent
close $filename

set inputList [split $data "\n"] 

array set arrlist {}
set i 0
while { $i < [llength $inputList]} {
 set arrlist($i) [lindex $inputList $i]
 incr i
 }
set larray [array size arrlist] 

#replacing VDD_node with net
puts "\033\[33mEnter the supply (VDD) node:\033\[0m"
set VDD_node [gets stdin]
puts "\033\[33mEnter the supply voltage name:\033\[0m"
set VDD_name [gets stdin]

set i 0
while {$i<$larray} {
if {[lsearch -exact -inline  $arrlist($i) $VDD_name] == $VDD_name} {
set VDD_line $arrlist($i)
break
}
incr i
}

set i 0
while {$i<$larray} {
regsub -all  $VDD_node $arrlist($i) "net" arrlist($i)
incr i
}

set i 0
while {$i<$larray} {
if {[lsearch -exact -inline  $arrlist($i) $VDD_name] == $VDD_name} {
set arrlist($i) $VDD_line
break
}
incr i
}
# inserting Vnet line  
  set i 0
while { $i< $larray} {
 if { [lindex $arrlist($i) 0]== $VDD_name} {
   break
 }
incr i
}
 #insertion after VDD_name line
   incr larray 1
   set i [expr $i+1]
  set j [expr $larray-1]
 while {$j > $i} {
   set arrlist($j) $arrlist([expr $j-1])
   set j [expr $j-1]
   }
  set arrlist($i) "Vnet $VDD_node net 0"
 #inserting quit before .endc
set i 0
while { $i< $larray} {
 if { [lindex $arrlist($i) 0]== ".endc"} {
   break
 }
incr i
}
   incr larray 1
  set j [expr $larray-1] 
 while {$j >=$i} {
   set arrlist($j) $arrlist([expr $j-1])
   set j [expr $j-1]
   }   
  set arrlist($i) "quit"
 
#entering choice for power
puts "\n\033\[33mEnter 1 to get average power netlist or Enter 2 to get leakage power:\033\[0m"
set choice [gets stdin]

if {$choice ==1} {
#average switching power of circuit
puts "\033\[33mEnter net supply voltage(VDD) value in volts:\033\[0m"
set VDD [gets stdin]
puts "\033\[33mEnter the minimum time period of circuit in ns:\033\[0m"
set T_ns [gets stdin]
set T_s [expr $T_ns*1e-9]

set Cy_max_nF [expr $T_ns/$VDD]
if {$Cy_max_nF >=1} {
set Cy_n [expr floor($Cy_max_nF)]
} else {
set Cy_n [expr $Cy_max_nF - 0.1]
}

set Cy [expr $Cy_n * 1e-9]
set Ry_k [format "%.3f" [expr 100*$Cy_n]]
set Ry  [expr 1000*$Ry_k ]

set Cy_n [format "%.3f" $Cy_n]
set Cy [expr $Cy_n * 1e-9]
set beta [format "%.3f" [expr $Cy*$VDD/$T_s]]


#inserting F>R>C lines 
  # inserting before .tran line
 set i 0
while { $i< $larray} {
 if { [lindex $arrlist($i) 0]== ".tran"} {
   break
 }
incr i
}
   incr larray 3
  set j [expr $larray-4] 
 while {$j >=$i} {
   set arrlist([expr $j+3]) $arrlist($j)
   set j [expr $j-1]
   }   
  set arrlist($i) "Fnet 0 netl Vnet $beta"
  set arrlist([expr $i+1]) "Cnet netl 0 $Cy"
  set arrlist([expr $i+2]) "Rnet netl 0 $Ry"
  
#concating uic to .tran line
set i 0
while { $i< $larray} {
 if { [lindex $arrlist($i) 0]== ".tran"} {
 set arrlist($i) [concat $arrlist($i) uic]
 }
incr i
}

#inserting plot and wrdata lines
set i 0
while { $i< $larray} {
 if { [lindex $arrlist($i) 0]== "run"} {
   break
 }
incr i
}
 #insertion after run
   incr larray 2
   set i [expr $i+1]
  set j [expr $larray-1]
 while {$j > [expr $i+1]} {
   set arrlist($j) $arrlist([expr $j-2])
   set j [expr $j-1]
   }
  set arrlist($i) "plot V(netl)"
  set arrlist([expr $i+1]) "wrdata outtxtfile.txt V(netl)"


# Writing into newfile
set file [open "switchingpower_netlist.cir" w]
set i 0
while {$i < $larray} {
 puts $file $arrlist($i)
 incr i
}
close $file
#printing final statements
puts "\n\033\[033mRunning the modified netlist \033\[0m \033\[034mswitchingpower_netlist.cir\033\[0m \033\[033m in ngspice\033\[0m"

#ngspice shell
puts "Executing ngspice..."
exec -ignorestderr -- ngspice switchingpower_netlist.cir
puts "Execution of ngspice done."

#Finding average switching power 
puts "\n\033\[32m**Running average switching power code **\033\[0m"
puts "\n\033\[32m**Assuming atleast one switching activity occurs in given time interval**\033\[0m\n"
#puts "\033\[33mEnter netlist file name with file extension\033\[0m" 
set file_name "switchingpower_netlist.cir"
set file_input [open $file_name r]
set file_content [read $file_input]
set input_list [split $file_content "\n"]
set i 0 
while {$i<[llength $file_content]} {
 if {[lindex $file_content $i]=="wrdata" } {
    set txt_filename [lindex $file_content [expr $i+1]]
	break
 }
 incr i
}
set fname "outtxtfile.txt"
set FileInput [open $fname r]
set filecontent [read $FileInput]
set inputList [split $filecontent "\n"]

set rownum [expr [llength $inputList] - 1]

 #Accesing data file
 
 if {[lindex [lindex $inputList 0] 0] != $T_s} {
 set i 0
 while {$i < $rownum } {
  if {[lindex [lindex $inputList $i] 0] == $T_s} {
	 
	  set sum1 [lindex [lindex $inputList $i] 1]
	  break  
	} else {	
	set T_splus [expr $T_s * 2]
	 if {[lindex [lindex $inputList 0] 0] != $T_splus} {
	 set j 0
     while {$j < $rownum } {
	 if {[lindex [lindex $inputList $j] 0] == $T_splus } {
	  set sum1 [lindex [lindex $inputList $j] 1]
	  break
	 } else {
	  if {[lindex [lindex $inputList $j] 0]>$T_splus} {
	  set sum1 [lindex [lindex $inputList [expr $j-1]] 1]
	  break
	  }
	 }
	 incr j
	 }
    } else {
    set T_splusplus [expr $T_splus + $T_s]
    set j 0
    while {$j < $rownum } {
	if {[lindex [lindex $inputList $j] 0] == $T_splusplus } {
	  set sum1 [lindex [lindex $inputList $j] 1]
	  break
	} else {
	  if {[lindex [lindex $inputList $j] 0]>$T_splusplus} {
	 set sum1 [lindex [lindex $inputList [expr $j-1]] 1]
	 break
	 }
	}
	incr j
	}
   }
 }
incr i
}
} else {	
	set T_splus [expr $T_s * 2]
	 if {[lindex [lindex $inputList 0] 0] != $T_splus} {
	 set j 0
     while {$j < $rownum } {
	 if {[lindex [lindex $inputList $j] 0] == $T_splus } {
	  set sum1 [lindex [lindex $inputList $j] 1]
	  break
	 } else {
	  if {[lindex [lindex $inputList $j] 0]>$T_splus} {
	  set sum1 [lindex [lindex $inputList [expr $j-1]] 1]
	  break
	  }
	 }
	 incr j
	 }
    } else {
    set T_splusplus [expr $T_splus + $T_s]
    set j 0
    while {$j < $rownum } {
	if {[lindex [lindex $inputList $j] 0] == $T_splusplus } {
	  set sum1 [lindex [lindex $inputList $j] 1]
	  break
	} else {
	  if {[lindex [lindex $inputList $j] 0]>$T_splusplus} {
	 set sum1 [lindex [lindex $inputList [expr $j-1]] 1]
	 break
	 }
	}
	incr j
	}
   }
 }
#setting lower index to 0	
 set sum2 [lindex [lindex $inputList 0] 1]
set avgpwr [expr $sum1 - $sum2]

if {$avgpwr < 0} {
 puts "\n\033\[31mError:Couldn't find the power for given timeperiod -- no corresponding entries for power values.\033\[0m"
 } else {
puts "\n\033\[33mAverage Switching power in watt is $avgpwr\033\[0m"
}
close $FileInput

exec rm -f  "outtxtfile.txt"

} elseif {$choice==2} {

#leakage power 
puts "\033\[33mEnter no.of time varying inputs present in circuit:\033\[0m"
set in_num [gets stdin]
puts "\033\[33mEnter those input names(press enter after each name):\033\[0m"
array set in_node_arr {}
set i 0
 while {$i<$in_num} {
 set in_node_arr($i) [gets stdin]
 incr i
}
#replacing inputs with 0Vdc
set j 0
while {$j< $in_num} {
set i 0
while {$i<$larray} {
if {[lsearch -exact -inline  $arrlist($i) $in_node_arr($j)] == $in_node_arr($j)} {
set arrlist($i) [concat [lreplace $arrlist($i) 3 end] 0]
break
}
incr i
}
incr j
}
# replacing .tran line by .op 
set i 0
while { $i< $larray} {
 if { [lindex $arrlist($i) 0]== ".tran"} {
 set arrlist($i) [concat [lreplace $arrlist($i) 0 end] .op]
  break
 }
incr i
}
#deleting all other statements under run
set i 0
while {$i<$larray} {
if {[lsearch -exact -inline  $arrlist($i) "plot"] == "plot"} {
set arrlist($i) [lreplace $arrlist($i) 0 end]
}
incr i
}
# adding print pwr line
set i 0
while { $i< $larray} {
 if { [lindex $arrlist($i) 0]== "run"} {
   break
 }
incr i
}
 #insertion after run
   incr larray 1
   set i [expr $i+1]
  set j [expr $larray-1]
 while {$j > $i} {
   set arrlist($j) $arrlist([expr $j-1])
   set j [expr $j-1]
   }
  set arrlist($i) "print I(Vnet)*V($VDD_node)" 
  set arrlist([expr $i+1]) "quit"
# Writing into newfile
set file [open "leakagepower_netlist.cir" w]
set i 0
while {$i < $larray} {
 puts $file $arrlist($i)
 incr i
}
close $file
#printing final statements
puts "\n\033\[033mRunning the modified netlist\033\[0m \033\[034mleakagepower_netlist.cir\033\[0m \033\[033m in ngspice.\033\[0m"
puts "Executing ngspice..."
exec -ignorestderr -- ngspice leakagepower_netlist.cir >leakage.txt
puts "Executation of ngspice done."

puts "\n\033\[033mLeakage power in watt is the printed value of I(Vnet)*V($VDD_node):\033\[0m"
set leakres [open "leakage.txt" r]
   while {[gets $leakres line] >= 0} {
            if [regexp -- "vnet" $line] {
                puts $line
            }
        }
close $leakres

exec rm -f  "leakage.txt"

} else {
 puts "\n\033\[33mWrong input. Enter either 1 or 2\033\[0m"
 }
