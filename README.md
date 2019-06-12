About osgSWIG
-------------

OpenSceneGraph is a comprehensive OpenGL based scene graph
library. It provides its own introspection layer for scripting
however there are various scenarios where an outside-in approach
for scripting is more appropriate.

The SWIG wrappers for OpenSceneGraph were initially developed by
Hartmut Seichter at the Human Interface Technology Laboratory New Zealand
as part of the FRST (http://frst.govt.nz/) funded project MagicBook. The
project was moved from the HITLabNZ to the community in order to get more 
involvement.
Soon after the TuDelft Data Visualization group contributed a vastly updated version.


Using CMake build system
------------------------
steps:

    $> mkdir build
    $> cd build
    $> cmake ..  -DCMAKE_BUILD_TYPE=Release
    $> make

(or use cmakesetup on windows)

Note: It is highly recommended to use an out-of-source build as 
it doesn't polute the source tree and facilitates multiple builds 
per source tree.

Please consult the CMake documentation (http://cmake.org) for more options.
