Power Analysis Tool using TCL
=============================
This project is trying to develop an open source power estimation tool. It mainly focuses on average switching power and leakage power.
The analysis is based on Tool Command Language (TCL) code and takes SPICE netlist and fewer parameters as inputs and gives required power values.

Set Up for NI Multisim in windows
===================================
1) Download NI Multisim 14.1 from https://softfamous.com/ni-multisim/download/
2) Click on `Download from ni.com ` 
  <img align ="left" src="https://user-images.githubusercontent.com/66675990/84494289-d9744800-acc6-11ea-91a3-938bc8146741.JPG" width= "250" >  
   <img align ="center" src="https://user-images.githubusercontent.com/66675990/84496533-b9df1e80-acca-11ea-9606-0a4dd1d316c9.JPG" width="250" > 
   
3) Click on `GET STUDENT DOWNLOAD `      
4) Unzip the compressed folder and save in preferred folder.        
5) Open `setup.exe` file and install.

**Note: NI Multisim can be downloaded only on windows OS. For MAC OS or LINUX users, Windows OS have to be installed using virtual machine or can use online MULTISIM LIVE https://www.multisim.com/

## Steps to draw and run schematic on NI multisim in windows  
1) Open NI Multisim 14.1 from start menu
2) `File -> New -> Create `
3) Draw schematic and save(Ctrl +S)
4) Schematic file will be saved in .ms14 format
5) To open file whch is already created
   `File -> Open -> choose schematic file in .ms14 extension` 
6) Go to` Simulate -> Analyses and simulation` 
7) Choose required analysis and enter variables and choose parameters to be displayed .
8) To run 
   `Simulate -> Run `
   
   <img align ="right" src= "https://user-images.githubusercontent.com/66675990/84498900-19d7c400-accf-11ea-9578-a5bc275acd94.JPG" width=" 200">   
   
9) Outputs are shown on simulation window.
10) For spice netlist
   `Transfer -> Export SPICE Netlist -> Save` (save in .cir extension)   
   
   For 4-bit fast adder circuit shown in figure, Download `4bitfastadder_test, 4bitfastadder, 5inputAND and 4 input AND gate .ms14` 
   extension files from this repository in same folder and run the simulation.   
   
Set up to run TCL code
=======================
You must have tcl compiler like Active TCL or you can run code in any online TCL compiler.
Steps to run TCL co
1. Save the code in TCL format with .tcl extension
2. Open the command promt and change current directory to the directory where files are there. For example  `cd D:\TCL Documents` 
3. To run  `tclsh powercaladder.tcl`

<img src= "https://user-images.githubusercontent.com/66675990/84500623-8b654180-acd2-11ea-8de4-231f08158b59.JPG" width ="300">

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
