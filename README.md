Power Analysis Tool using TCL
=============================
This project is trying to develop an open source power estimation tool. It mainly focuses on average switching power and leakage power. The analysis is based on Tool Command Language (TCL) code and takes SPICE netlist and fewer parameters as inputs and gives required power values.

Table of contents
=================
<!--ts-->
   * [Power Analysis Tool using TCL](#power-analysis-tool-using-tcl)
   * [Table of contents](#table-of-contents)
   * [Power Tool Strategy](#power-tool-strategy)
   * [Setup for NGSPICE](#setup-for-ngspice)
   * [Setup for TCL shell](#setup-for-tcl-shell)
   * [Steps to run Repository files](#steps-to-run-repository-files)
      * [CMOS Inverter](#cmos-inverter)
      * [One-bit Fast Adder](#one-bit-fast-adder)
   * [Circuits Power Values](#circuits-power-values)
   * [Contact Information](#contact-information)
<!--te-->

# Power Tool Strategy
  Power estimation of an circuit is done using an simple formula power P = I X V. 
  - Average swithing power is calculated as product of average switching current and VDD i.e., Iavg xVDD.
  - Leakage ppower is calculated as product of leakage current and VDD i.e., Ileakage x VDD. 
 ######
 The main concept used for power calculation is creating a current controlled current source and taking average power which equals to 
 voltage step across the current source  during the time period. The voltage step is same for each time period. For clear information go through 
 [kang pg 245-248](https://github.com/yalamanchilivahini5/VSD-opensource-TCL-power-tool/blob/master/Power%20Information/cmos%20digital%20circuits%20Kang.pdf)
  
  **Basic Idea on calculating power**
  <img align="center" width="500"  src="/Images/kangcir_eqn.jpg">

# Power Tool Usage

## Dependencies to run this power tool
 TCL Power Tool mainly works on NGSPICE and TCL shell. Here are steps for setup of required open source tools.
 - For installing ngspice 
  ```
  $ sudo apt-get install ngspice
  ```
 - Most of Linux/Unix systems have inbuilt tcl shell. If not installed prior then for installing TCL shell
 ```
 $ sudo apt-get install tcl
 ```

# Steps to run TCL Power Tool
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
