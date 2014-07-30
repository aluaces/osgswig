%module osgVolume

#ifdef SWIGPERL
%{
#undef STATIC
#ifdef WIN32
#undef pause
#undef ERROR
#undef accept
#endif
%}
#endif

%include "globals.i"

%include osg_header.i
%include osgGA_header.i

/* import stuff from OpenSceneGraph */
%import osg.i
%import osgGA.i


%{

#include <osgVolume/Export>
#include <osgVolume/Property>
#include <osgVolume/VolumeTechnique>
#include <osgVolume/FixedFunctionTechnique>
#include <osgVolume/Layer>
#include <osgVolume/Locator>
#include <osgVolume/RayTracedTechnique>
#include <osgVolume/Version>
#include <osgVolume/Volume>
#include <osgVolume/VolumeTile>

using namespace osgVolume;

%}


/* remove the linkage macros */
%define OSG_EXPORT
%enddef
%define OSGVOLUME_EXPORT
%enddef

// ignore nested stuff




/* include the actual headers */

%include osgVolume/Export
%include osgVolume/Property
%include osgVolume/VolumeTechnique
%include osgVolume/FixedFunctionTechnique
%include osgVolume/Layer
%include osgVolume/Locator
%include osgVolume/RayTracedTechnique
%include osgVolume/Version
%include osgVolume/Volume
%include osgVolume/VolumeTile

