# average power

#drawbacks of code: pwr values must be there in column 1

#Accessing data from given file 
puts "Enter file name with file extension" 
set cirfilename [gets stdin] ; #input from keyboard

exec -- ngspice $cirfilename &
#exec -- ngspice quit &
exit 0
close $cirfilename

#set cirfile [open $cirfilename w]
exec -- tclsh avgpwr.tcl &
exit 0


