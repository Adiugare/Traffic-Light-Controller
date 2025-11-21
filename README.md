This traffic light controller project implements a robust, six-state Moore finite state machine (FSM) designed for managing vehicle flow at a multi-road intersection with roads labeled M1, MT, M2, and S. The project is developed using Verilog HDL and targets FPGA implementation through VLSI design techniques.

Standards and Design Compliance
The controller design aligns with digital design best practices, leveraging FSM principles to ensure synchronous and deterministic operation.

Timing and sequencing follow standard traffic management conventions where each state represents a distinct combination of traffic light signals (Red, Yellow, Green) per road based on configurable timing parameters.

The controller supports safe vehicle flow by enforcing strict phase durations and orderly state transitions without conflicting green lights.

The design is synthesizable and verified using industry-standard Electronic Design Automation (EDA) tools (e.g., Xilinx Vivado), and is compatible with FPGA or ASIC implementation.

The project follows industry guidelines for modular, parameterized RTL design for scalability and ease of future enhancements.

Functional Specification
The FSM cycles through six states (S0 to S5), controlling lights for four roads: M1, MT, M2, and S.

State sequence and durations are configurable with timing parameters such as Traffic Main Green (TMG), Transition Yellow (Ty), Traffic Turn Green (TTG), and Traffic Secondary Green (TSG).

The system employs a synchronous, clock-driven counter to manage state durations, supporting deterministic state changes on clock edges.

Outputs are three-bit encoded signals representing Red (100), Yellow (010), and Green (001) states for each road’s light.

The controller operates continuously, cycling through states to manage traffic efficiently.

Architecture and Operation
The design utilizes a 3-bit state encoding to represent six states within the FSM.

Inputs include system clock and reset signals; outputs are traffic light signals for all four roads.

The internal architecture includes a state register, next state logic, timer counter, and output logic to ensure real-time traffic signal management.

The controller implements a Moore machine where outputs depend solely on the current state, simplifying verification and timing analysis.

Safety and Reliability
The FSM ensures no conflicting green lights occur simultaneously, preventing dangerous traffic conditions.

The timed state transitions provide warning (yellow light) phases to prepare vehicles for stopping or starting.

The design meets timing constraints verified through simulation and synthesis reports, ensuring reliable and glitch-free operation.

Reset functionality initializes the controller safely to the initial state S0.

Project Scope and Limitations
The controller does not currently support adaptive traffic sensing or pedestrian crossing signals; it uses fixed timing sequences.

Future enhancements can include adaptive timing via sensors, pedestrian button integration, emergency vehicle priority, and communication interfaces for networked control.
