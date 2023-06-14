from IPython.display import clear_output, display

import time
import os
import sys
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
import pandas as pd
import flopy

print(sys.version)
print("numpy version: {}".format(np.__version__))
print("matplotlib version: {}".format(mpl.__version__))
print("pandas version: {}".format(pd.__version__))
print("flopy version: {}".format(flopy.__version__))

# first lets load an existing model
model_ws = os.path.join("./data/AMEC/ModelFiles/CalibrationModel/mf2005")
ml = flopy.modflow.Modflow.load(
    "Calibration.nam",
    version='mf2005',
    model_ws=model_ws,
    verbose=True,
    check=True,
    exe_name="mf2005.exe",
)

# Look at some plots
ml.plot()
plt.show()
ml.modelgrid.plot()
plt.show()
ml.dis.botm.plot()
plt.show()
ml.dis.top.plot()
ml.rch.plot()

#list packages
ml.get_package_list()

#Let's write a shapefile of the DIS package

ml.dis.export(os.path.join("data", "model_dis.shp"))

#Let's also write a netCDF file with all model inputs

ml.export(os.path.join("data", "horsecreekmodel.nc"))

#Change model directory, modify inputs and write new input files
ml.external_path = "ref"
ml.model_ws = "data"
#run the model
ml.write_input()

ml.run_model()
print(ml.wel.stress_period_data)

ml.remove_package

ml.wel.export(os.path.join("data", "model_wel.shp")

ml.BCF6.hy.export(os.path.join("data", "model_horiz_k_layer1.shp"))

spd= ml.wel.stress_period_data.get_dataframe()

hds = flopy.utils.binaryfile.HeadFile("./data/Calibration.hds")
h = hds.get_data(kstpkper=(0, 0))
x = y = np.linspace(0, L, N)
y = y[::-1]
fig = plt.figure(figsize=(6, 6))
ax = fig.add_subplot(1, 1, 1, aspect="equal")
c = ax.contour(x, y, h[0], np.arange(90, 100.1, 0.2), colors="black")
plt.clabel(c, fmt="%2.1f")
h.export(os.path.join("data", "heads.shp"))
ml.BCF6.hy
h.plot()
plt.show()
