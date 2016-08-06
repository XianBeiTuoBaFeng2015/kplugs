#!/usr/bin/env python

import kplugs
import time

try:
    plug = kplugs.Plug()
    hook = kplugs.Hook()

    kernel_func = r'''

def my_hook(kp, regs):
    print "The registers are stored in %p" % regs
    return 0
'''
    my_hook = plug.compile(kernel_func)[0]
    hook.hook("sys_clone", my_hook) 
    time.sleep(10)
    hook.unhook(my_hook)

finally:
    kplugs.release_kplugs()
