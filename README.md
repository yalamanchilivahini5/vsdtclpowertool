Power Analysis Tool using TCL
===================================
This project is trying to develop an open source power estimation tool. It mainly focuses on average switching power and leakage power.
The analysis is based on Tool Command Language (TCL) code and takes SPICE netlist and fewer parameters as inputs and gives required power values.

Set Up for NI Multisim in windows
===================================
1) Download NI Multisim 14.1 from https://softfamous.com/ni-multisim/download/ 
2) Click on `Download from ni.com -> GET STUDENT DOWNLOAD`
 ![NI download 1](https://user-images.githubusercontent.com/66675990/84494289-d9744800-acc6-11ea-91a3-938bc8146741.JPG = 100x100)
3) Unzip the compressed folder and save in preferred folder.
4) Open `setup.exe` file and install.
## Steps to draw and run schematic on NI multisim in windows
1) Open NI Multisim 14.1 from start menu
2) click on Launch Multisimhttps://user-images.githubusercontent.com/66675990/84494606-733bf500-acc7-11ea-9087-33ec26cde735.JPG
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
   For 4-bit fast adder circuit Download `4bitfastadder_test, 4bitfastadder, 5inputAND and 4 input AND gate .ms14` extension files from this repository in same folder and run the simulation. 

Set up to run TCL code
=======================
You must have tcl compiler like Active TCL or you can run code in any online TCL compiler.
Steps to run TCL co
1. Save the code in TCL format with .tcl extension
2. Open the command promt and change current directory to the directory where files are there. For example  `cd D:\TCL Documents` 
3. To run  `tclsh powercaladder.tcl`
4. Power values are displayed on command promt window.

Contact Information
====================
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
 Co-Principal Investigator, EICT Academy,   
  and Associative Professor, EEE Department, IIT Guwahati
  trivedi@iitg.ac.in
