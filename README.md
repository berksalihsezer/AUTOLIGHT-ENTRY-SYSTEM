This project is a Verilog module that simulates a door control system using two sensors (x1 and x2). The module detects the entry and exit events based on the sensor signals and generates corresponding output signals for entry and exit.
*Module Functionality*
Entry (Entry signal): If sensor 1 (x1) is 0 and sensor 2 (x2) is 1, the system detects an entry.
Exit (Exit signal): If sensor 1 (x1) is 1 and sensor 2 (x2) is 0, the system detects an exit.
*Usage*
This Verilog module takes sensor inputs (x1 and x2) and generates output signals based on the sensor values. The entry and exit are determined as follows:
Entry (x1 = 0, x2 = 1): The system detects an entry.
Exit (x1 = 1, x2 = 0): The system detects an exit. 
*Counter*
When Entry occurs  (x1 = 0 and x2 = 1), the counter increments by 1, indicating a person has entered.
When Exit occurs (x1 = 1 and x2 = 0), the counter decrements by 1, indicating a person has exited.
*Clock and Reset*
The counter is controlled by a clock signal, which ensures the counter updates at regular intervals.
