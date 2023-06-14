import matplotlib.pyplot as plt
import flopy.utils.binaryfile as bf

# This custom formatter removes trailing zeros, e.g. "1.0" becomes "1", and
# then adds a percent sign.
def fmt(x):
    s = f"{x:.1f}"
    if s.endswith("0"):
        s = f"{x:.0f}"
    return rf"{s}" if plt.rcParams["text.usetex"] else f"{s}"


hds = bf.HeadFile("./data/Calibration.hds")
myobj = hds.get_data()
fig = plt.figure(figsize=(6, 6))
ax = fig.add_subplot(1, 1, 1, aspect="equal")
CS = ax.contour(head[0, :, :], levels=np.arange(4000, 5100, 50), extent=ml.modelgrid.extent)
ax.clabel(CS, CS.levels, inline=True, fmt=fmt, fontsize=10)
plt.show()
hds.plot()
plt.show()

ax = fig.add_subplot(1, 1, 1, aspect="equal")
modelmap = flopy.plot.PlotMapView(model=ml, layer=1, ax=ax)
head.to

head=np.array(head)
np.save('mysave.npy', head)
spdflux=ml.packagelist[3].stress_period_data.df.flux
ml.wel.stress_period_data=spd.to_numpy()
spd=r.new_spd
type(spd)
type(ml.wel.stress_period_data)
spd=ml.wel.stress_period_data.get_dataframe()
