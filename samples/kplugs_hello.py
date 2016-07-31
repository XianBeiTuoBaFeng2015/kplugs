#!/usr/bin/python
import kplugs

try:
    kernel_func = r'''

def hello_world(string):
    buffer(string, 0x100)
    print "%s" % string
'''

    plug = kplugs.Plug()
    hello_world = plug.compile(kernel_func)[0]
    hello_world("hello world!")

finally:
    kplugs.release_kplugs()
