# average power

#drawbacks of code: pwr values must be there in column 1

#Accessing data from given file 
puts "Enter file name with file extension" 
set filename [gets stdin] ; #input from keyboard
#set filename "output.txt"
set FileInput [open $filename r]
set filecontent [read $FileInput]
set inputList [split $filecontent "\n"]

 set rownum [expr [llength $inputList] - 1]
 #puts $rownum
 #puts  " [lindex $inputList $rownum]"
 #puts  " [lindex $inputList [expr "$rownum -1"]]"
 
 array set pwr {}
 set i 0
 while {$i < $rownum } {
	#puts "[lindex [lindex $inputList $i] 1]" # powervalues are in column 1
	set pwr($i) "[lindex [lindex $inputList $i] 1]"
	incr i
	}
# #calculating average of power values	
  set avgpwr 0 
  set i 0
 while {$i < $rownum } {
	if {$pwr($i) < 0} {
		set avgpwr [expr "$avgpwr + [expr "-1 * $pwr($i)"]"]
		} else {
			set avgpwr [expr  "$avgpwr + $pwr($i)"]
			}
	incr i
 } 
set  avgpwr [expr "$avgpwr/[expr "$rownum -1"]"]
puts "Average power is $avgpwr"
# Optimization suggestion
if {$avgpwr >= 1e-4} {
puts "Heavy Power. Circuit need to be Optimized"
} 

close $FileInput
