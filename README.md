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
   * [Setup for TCL shell](#setup-for-tcl-shell)
   * [Steps to run Repository files](#steps-to-run-repository-files)
      * [CMOS Inverter](#cmos-inverter)
      * [One-bit Fast Adder](#one-bit-fast-adder)
   * [Circuits Power Values](#circuits-power-values)
   * [SetUp for NI Multisim in windows](#setup-for-ni-multisim-in-windows)
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
  
Setup for TCL shell
====================
Most of linux/Unix/Mac OS systems have inbuilt tcl. For windows OS, one must have tcl compiler like Active TCL.
- If already not installed, open terminal and enter `sudo apt-get install tcl` to install TCL.
- To run tcl code, open terminal and enter `$ tclsh <filename>.tcl`

# Steps to run Repository files
- First download or clone this repository `git clone https://github.com/yalamanchilivahini5/intern_poweranalysis_TCL.git`   
- To see circuit diagrams of *inverter* and *1-bit fast adder circuit*, Go to `Images`and see *inv_ckt.jpg* and *1bitadder_ckt.jpg*   
- Here are the steps for circuits simulation and run tcl codes to obtain power values.
- Make sure that netlist file, included files in netlist (if any) and power codes are present in same folder.
- Here is the brief usage picture to run these codes.
 
 <img align="center" width="700"  src="/Images/usage pic final.jpg">

### CMOS Inverter
 1) Go to 'NGspice power folder' to run simulations (One can directly open terminal from Ngspice Power folder also). 
   ```
    $ cd Ngspice\ power/
   ```
 2) (optional step) Run desired circuit Netlist(for example *inverter*) to get output waveforms and then exit from ngspice shell.
   ```
   $ ngspice inv.cir
   ```
   **Inverter Transient analysis**    
    
   <img align="center" width="500"  src="/Images/inv_inout.JPG">
  
 3) To get average switching power and leakage power, run TCL code `power_modified.tcl` and enter required values.
   ```
   $ tclsh power_modified.tcl
   ```
 4) Enter required details and enter 1 for average switching power or 2 for leakage power. 
 5) If choice is average switching power enter required data and press enter.
 
  **Average Switching power of inverter from TCL code**
 
   <img align="center" width="500"  src="/Images/inv_tcl_avgpwr.JPG">
   
 6) Additional file namely `switchingpower_netlist.cir` is added into the directory.
 7) If choice is leakage power, enter required data and press enter.
  
   **Leakage power of inverter from TCL code**
   
  <img align="center" width="500"  src="/Images/inv_tcl_lkgpwr.JPG">
  
 8) A netlist file namely `leakagepower_netlist.cir` is added to directory.
 9) To view waveforms for modified netlist, run those files using ngspice by commenting quit statement.
 
   **Commenting quit statement in netlist**
 
  <img align="center" width="300"  src="/Images/comment_quit.jpg">
 
 ***Average Switching Power Netlist*** 
 ```
 $ ngspice switchingpower_netlist.cir`
 ```
   **Power plot of Inverter**
 
  <img align="center" width="500"  src="/Images/inv_avgpwr.JPG">
 
 ***Leakage Power Netlist***
 
 ```
 $ ngspice leakagepower_netlist.cir
 ``` 
  
 ### One-bit Fast Adder 
  Follow same steps to run any other simulation. Here is another circuit '1-bit fast adder'.
  
  1) Go to 'NGspice power folder' to run simulations (One can directly open terminal from Ngspice Power folder also). 
   ```
    $ cd Ngspice\ power/
   ```
 2) (optional step) Run desired circuit Netlist(here *1bit adder*) to get output waveforms and then exit from ngspice shell.
   ```
   $ ngspice 1bitadder.cir
   ```
   **1-bit fast adder Inputs A, B, Cin and Outputs S, Cout **    
    
   <img align="center" width="900" src="/Images/1bitadder_inout.JPG">
  
 3) To get average switching power and leakage power, run TCL code `power_modified.tcl` and enter required values.
   ```
   $ tclsh power_modified.tcl
   ```
 4) Enter required details and enter 1 for average switching power or 2 for leakage power.
 5) If choice is for average switching power, enter required data and press enter.
 
   **Average switching power of 1-bit fast adder from TCL code**
 
  <img align="center" width="500"  src="/Images/1bitadder_tcl_avgpwr.JPG">
 
 6) Additional file namely `switchingpower_netlist.cir` is added into the directory.
 7) If choice is leakage power, enter required data and press enter.
  
   **Leakage power of 1-bit fast adder from TCL code**
   
  <img align="center" width="500"  src="/Images/1bitadder_tcl_lkgpwr.JPG">
  
 8) A netlist file namely `leakagepower_netlist.cir` is added to directory.
 9) To view waveforms for modified netlist, run those files using ngspice by commenting quit statement.
 
 ***Average Switching Power Netlist*** 
 ```
 $ ngspice switchingpower_netlist.cir`
 ```
 
   **Power plot of 1-bit fast adder**
 
  <img align="center" width="500"  src="/Images/1bitadder_avgpwr.JPG">
 
 ***Leakage Power Netlist***
 
 ```
 $ ngspice leakagepower_netlist.cir
 ```
   
 ## Circuits Power Values 
 The switching power and leakage power values calculated for different circuits is presented in an excel sheet *Circuits power values*.
 Also there is a power tools comparision presented in excel sheet *Comparing power tools_charu and vahini*.
 
 **Circuits power table**
 
 <img align="center" width="600"  src="/Images/Circuits_powervalues.JPG">
 
  
SetUp for NI Multisim in windows
=================================
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
   <img align ="right" width="200" src="/Multisim_simulation/4bit adder multisim/4bit fast adder simckt 1.JPG"> 
   
9) Outputs are shown on simulation window.
10) For spice netlist
   `Transfer -> Export SPICE Netlist -> Save` (save in .cir extension)   
   
   For 4-bit fast adder circuit shown in figure, Go to `Multisim_simulation -> 4bit adder multisim`  from this repository
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
