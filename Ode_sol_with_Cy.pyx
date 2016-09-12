# coding=utf-8

import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt
from numba import jit
import time
import cython

@jit
def func(y,t,*args):
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

    #dem1 = P.dot(y) + [0,-y[0]*y[2],y[0]*y[1]]
    #return dem1
    return [-p * y[0] + p * y[1], -y[0] * y[2] + r * y[0] - y[1], y[0] * y[1] - b * y[2]]
@jit
def solve_ode():
    #def parame

    p = 10
    r = 28
    b = 8/3
    #P = np.array([[-p,p,0],[r,-1,0],[0,0,-b]])
    y0 = np.array([0.1,0.1,0.1])
    st = np.arange(0,3600,1)

    t = time.time()
    y = odeint(func,y0,st,args=(p,r,b))
    print("total time:", time.time() - t, "\na process time:", (time.time() - t) / 10000)
    #plt.figure()
    #plt.plot(y[:,0],y[:,1])
    #plt.show()


solve_ode()

