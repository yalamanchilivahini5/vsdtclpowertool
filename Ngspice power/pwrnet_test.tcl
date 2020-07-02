
puts "\n\033\[32m**The spice netlist file has to be run before to get the txt file**\033\[0m"
puts "\n\033\[32m**Assuming atleast one switching occurs in given time interval **\033\[0m \n"
puts "\033\[33mEnter netlist file name with file extension\033\[0m" 
set file_name [gets stdin]
set file_input [open $file_name r]
set file_content [read $file_input]
set input_list [split $file_content "\n"]
set i 0
#puts "[lindex $file_content 0]" 
while {$i<[llength $file_content]} {
 if {[lindex $file_content $i]=="wrdata" } {
    set txt_filename [lindex $file_content [expr $i+1]]
	break
 }
 incr i
}
puts $txt_filename

set fname $txt_filename
puts "\033\[33mEnter minimum time period of circuit in sec\033\[0m"
 set T_s [gets stdin]
#input from keyboard
#set filename "output.txt"
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
#setting the time period as 	
 set sum2 [lindex [lindex $inputList 0] 1]
	
#puts $sum1  
#puts $sum2
set avgpwr [expr $sum1 - $sum2]

if {$avgpwr < 0} {
 puts "Error: Couldn't find the power for given timeperiod -- no corresponding entries in output file"
 }
puts "Average Switching power is $avgpwr"

close $FileInput
