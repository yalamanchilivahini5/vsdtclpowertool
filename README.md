Power Analysis Tool using TCL
===================================
This project is trying to develop an open source power estimation tool. It mainly focuses on average switching power and leakage power.
The analysis is based on Tool Command Language (TCL) code and takes SPICE netlist and fewer parameters as inputs and gives required power values.

Set Up for Simulation
===================================
First install NI multisim from any available site. After steps to draw and run schematic on NI multisim in windows are as follows:
1) Open NI Multisim 14.1 from start menu
2) click on Launch Multisim
3) `File -> New -> Create `
4) Draw schematic and save(Ctrl +S)
5) Schematic file will be saved in .ms14 format
6) To open file whch is already created
   `File -> Open -> choose schematic file in .ms14 extension` 
7) Go to` Simulate -> Analyses and simulation` 
8) Choose required analysis and enter variables and choose parameters to be displayed .
9) To run 
   `Simulate -> Run `
10) Outputs are shown on simulation window.
11) For spice netlist
   `Transfer -> Export SPICE Netlist -> Save` (save in .cir extension)

Set up to run TCL code
===================================
You must have tcl compiler like Active TCL or u can run code in any online TCL compiler.
Steps to run TCL code:
1. Save the code in TCL format with .tcl extension
2. Open the command promt and change current directory to the directory where files are there. For example  `cd D:\TCL Documents` 
3. To run  `tclsh powercaladder.tcl`
4. Power values are displayed on command promt window.

Contact Information
===================================
- YALAMANCHILI VAHINI 
 M.tech Embedded Systems, NIT Jamshedpur
  vahini5398@gmail.com
- KUNAL GHOSH 
 Director, VSD Corp. Pvt. Ltd. 
  kunalpghosh@gmail.com
- PHILIPP GÜHRING 
Software Architect at LibreSilicon Association
  pg@futureware.at
 - Dr. GAURAV TRIVEDI 
 Co-Principal Investigator, EICT Academy, IIT Guwahati
