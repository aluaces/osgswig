#!/bin/env python

from osgswig import osg, osgUtil
# import osg, osgUtil

pt = osg.Polytope()
pi = osgUtil.PolytopeIntersector(pt)
isx = pi.getIntersections()
print(isx)
print(dir(isx))
# print isx.size()
print(len(isx))
