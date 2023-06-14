Calibration model = steady state model used to calibrate
Mgmt Scenarios = as described in the report
URF flatwater = used to generate unit response functions

Initial Heads for Transient = the head files to point the management scenario and URF models to. They'll use these as their initial conditions.

the fort.58 file stores the stream flow details. This is not a standard MODFLOW output file; rather it was written in-house to summarize stream/aquifer flux and stream flow. It's an output file that summarizes the flow in each stream cell. The headings in the file should be self-explanatory.

The model was developed using version 5 of Groundwater Vistas and MODFLOW 2000 with SURFACT. 