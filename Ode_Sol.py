
import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt
from numba import jit
import time

@jit
def func(y,time,*args):
    """
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    define function
    v0 is first values,
    time is numpy array. it can make by np.arrange(start time,end time,step)
     *args is parameter of ode. it needs to ref tuple.
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    """
    p = args[0]
    r = args[1]
    b = args[2]

    return[-p*y[0]+p*y[1],-y[0]*y[2]+r*y[0]-y[1],y[0]*y[1]-b*y[2]]
@jit
def solve_ode():
    #def parame
    p = 10
    r = 28
    b = 8/3
    y0 = [0.1,0.1,0.1]
    t = np.arange(0,3600,1)

    y = odeint(func,y0,t,args=(p,r,b))
    #plt.figure()
    #plt.plot(y[:,0],y[:,1])
    #plt.show()

t=time.time()
solve_ode()
print("total time:" , time.time()-t , "\na process time:" ,(time.time()-t)/10000)
