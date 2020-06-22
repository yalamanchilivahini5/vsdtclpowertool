Power Analysis Tool using TCL
=============================
This project is trying to develop an open source power estimation tool. It mainly focuses on average switching power and leakage power.
The analysis is based on Tool Command Language (TCL) code and takes SPICE netlist generated output text file and fewer parameters 
as inputs and gives required power values.

Table of contents
=================
<!--ts-->
   * [Power Analysis Tool using TCL](#power-analysis-tool-using-tcl)
   * [Table of contents](#table-of-contents)
   * [Setup for NGSPICE](#setup-for-ngspice)
   * [Setup to run TCL code](#setup-to-run-tcl-code)
   * [Steps to run Local files](#steps-to-run-local-files)
      * [CMOS Inverter](#cmos-inverter)
      * [Onebit Fast Adder](#one-bit-fast-adder)
   * [Contact Information](#contact-information)
<!--te-->

Setup for NGSPICE
==================
 [Ngspice](http://ngspice.sourceforge.net/devel.html) is an open source Spice simulator which gives outputs from SPICE Netlist
 that is saved with *.cir* extension. 
 - For installing ngspice in ubuntu
 `$ sudo apt-get install ngspice`
 - To enter into Ngspice shell 
  `$ ngspice`
 - To run code
  `ngspice 1 -> source <filename>.cir`
 - To plot curves
  ` ngspice 2 -> plot <vector>`
 - To come out of Ngspice shell
  ` ngspice 3 -> exit` or `ngspice 3 -> quit`
  
Set up to run TCL code
=======================
Most of linux/Unix systems have inbuilt tcl. For windows OS, one must have tcl compiler like Active TCL.
If already not installed, open terminal and enter `sudo apt-get install tcl` to install TCL.

## Steps to run TCL code
1. Save the code in TCL format with .tcl extension
2. Open the command promt (windows OS) or terminal (Ubuntu) and change current directory to the directory where files are there.
   For example  `cd D:\TCL Documents` 
3. To run `> tclsh <filename>.tcl` 
 For example `tclsh powercaladder.tcl`

<img src= "https://user-images.githubusercontent.com/66675990/84500623-8b654180-acd2-11ea-8de4-231f08158b59.JPG" width ="300">

4. Power values are displayed on command promt window.

  To get cmos inverter and 4-bit adder power values, Download *powercal.tcl* and *powercaladder.tcl* respectively from this repository and run TCL codes. 
  
  **Note: *These TCL codes are just for basic calculation, not full-pledged codes.*
  
# Steps to run Local files
First download or clone this repository `git clone https://github.com/yalamanchilivahini5/intern_poweranalysis_TCL.git`
## CMOS Inverter
 1)  To run CMOS Inverter simulations `cd ngspice_simulations`
 2) `$ ngspice inv_spec.cir`
 3)  `plot V(2) V(3)` 
 
 
Set Up for NI Multisim in windows
===================================
1) Download NI Multisim 14.1 from https://softfamous.com/ni-multisim/download/
2) Click on `Download from ni.com -> GET STUDENT DOWNLOAD  ` 
<br/>
  <img align ="left" src="https://user-images.githubusercontent.com/66675990/84494289-d9744800-acc6-11ea-91a3-938bc8146741.JPG" width= "300" > 
 <img  src="https://user-images.githubusercontent.com/66675990/84496533-b9df1e80-acca-11ea-9606-0a4dd1d316c9.JPG" width="300" >
   <br/>  
        
3) Unzip the compressed folder and save in preferred folder.   <br/>     
4) Open `setup.exe` file and install.

**Note: NI Multisim can be downloaded only on windows OS. For MAC OS or LINUX users, Windows OS have to be installed using virtual machine or can use online [MULTISIM LIVE](https://www.multisim.com/) or can run using [WINE](https://www.winehq.org/)

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
   
   For 4-bit fast adder circuit shown in figure, Download "4bit adder multisim"  from this repository 
   and run `4bitfastadder_test.ms14`  simulation. 
   

 
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
