%module osgDB

// #ifdef SWIGMAC

%ignore osgDB::fileExists;
%ignore osgDB::FieldReader::attach;
%ignore osgDB::concatPaths;
%ignore osgDB::getFilePath;
%ignore osgDB::getPathRoot;
%ignore osgDB::getRealPath;
%ignore osgDB::openArchive;
%ignore osgDB::ImageOptions::ImageOptions;
%ignore osgDB::findDataFile;
%ignore osgDB::findDataFile;
%ignore osgDB::readNodeFile;
%ignore osgDB::DotOsgWrapper::DotOsgWrapper;
%ignore osgDB::makeDirectory;
%ignore osgDB::readImageFile;
%ignore osgDB::readNodeFiles;
%ignore osgDB::writeNodeFile;
%ignore osgDB::DynamicLibrary::loadLibrary;
%ignore osgDB::DynamicLibrary::getProcAddress;
%ignore osgDB::findFileInPath;
%ignore osgDB::isAbsolutePath;
%ignore osgDB::readObjectFile;
%ignore osgDB::readShaderFile;
%ignore osgDB::writeImageFile;
%ignore osgDB::findLibraryFile;
%ignore osgDB::getPathElements;
%ignore osgDB::getPathRelative;
%ignore osgDB::getStrippedName;
%ignore osgDB::readRefNodeFile;
%ignore osgDB::writeObjectFile;
%ignore osgDB::writeShaderFile;
%ignore osgDB::getFileExtension;
%ignore osgDB::getServerAddress;
%ignore osgDB::readRefImageFile;
%ignore osgDB::getServerFileName;
%ignore osgDB::getServerProtocol;
%ignore osgDB::getSimpleFileName;
%ignore osgDB::readRefObjectFile;
%ignore osgDB::readRefShaderFile;
%ignore osgDB::convertToLowerCase;
%ignore osgDB::FieldReaderIterator::readSequence;
%ignore osgDB::FieldReaderIterator::readSequence;
%ignore osgDB::FieldReaderIterator::attach;
%ignore osgDB::findFileInDirectory;
%ignore osgDB::readHeightFieldFile;
%ignore osgDB::equalCaseInsensitive;
%ignore osgDB::equalCaseInsensitive;
%ignore osgDB::getDirectoryContents;
%ignore osgDB::getNameLessExtension;
%ignore osgDB::makeDirectoryForFile;
%ignore osgDB::writeHeightFieldFile;
%ignore osgDB::containsServerAddress;
%ignore osgDB::isFileNameNativeStyle;
%ignore osgDB::readRefHeightFieldFile;
%ignore osgDB::getNameLessAllExtensions;
%ignore osgDB::expandWildcardsInFilename;
%ignore osgDB::getLowerCaseFileExtension;
%ignore osgDB::RegisterDotOsgWrapperProxy::RegisterDotOsgWrapperProxy;
%ignore osgDB::convertFileNameToUnixStyle;
%ignore osgDB::getSortedDirectoryContents;
%ignore osgDB::setCurrentWorkingDirectory;
%ignore osgDB::convertFileNameToNativeStyle;
%ignore osgDB::getFileExtensionIncludingDot;
%ignore osgDB::convertFileNameToWindowsStyle;
%ignore osgDB::DeprecatedDotOsgWrapperManager::getLibraryFileNamesToTry;
%ignore osgDB::convertStringPathIntoFilePathList;
%ignore osgDB::appendPlatformSpecificLibraryFilePaths;
%ignore osgDB::appendPlatformSpecificResourceFilePaths;
%ignore osgDB::containsCurrentWorkingDirectoryReference;
%ignore osgDB::Output::wrapString;
%ignore osgDB::Output::getUniqueIDForObject;
%ignore osgDB::Output::setExternalFileWritten;
%ignore osgDB::Output::createUniqueIDForObject;
%ignore osgDB::Output::registerUniqueIDForObject;
%ignore osgDB::Registry::getLibrary;
%ignore osgDB::Registry::loadLibrary;
%ignore osgDB::Registry::closeLibrary;
%ignore osgDB::Registry::registerProtocol;
%ignore osgDB::Registry::addToArchiveCache;
%ignore osgDB::Registry::getFromObjectCache;
%ignore osgDB::Registry::addArchiveExtension;
%ignore osgDB::Registry::getFromArchiveCache;
%ignore osgDB::Registry::isProtocolRegistered;
%ignore osgDB::Registry::addEntryToObjectCache;
%ignore osgDB::Registry::addFileExtensionAlias;
%ignore osgDB::Registry::getRefFromObjectCache;
%ignore osgDB::Registry::removeFromObjectCache;
%ignore osgDB::Registry::getRefFromArchiveCache;
%ignore osgDB::Registry::readNodeImplementation;
%ignore osgDB::Registry::removeFromArchiveCache;
%ignore osgDB::Registry::readImageImplementation;
%ignore osgDB::Registry::writeNodeImplementation;
%ignore osgDB::Registry::readNodeImplementation;
%ignore osgDB::Registry::readImageImplementation;
%ignore osgDB::Registry::writeNodeImplementation;
%ignore osgDB::Registry::createLibraryNameForFile;
%ignore osgDB::Registry::readObjectImplementation;
%ignore osgDB::Registry::readShaderImplementation;
%ignore osgDB::Registry::writeImageImplementation;
%ignore osgDB::Registry::openArchiveImplementation;
%ignore osgDB::Registry::writeObjectImplementation;
%ignore osgDB::Registry::writeShaderImplementation;
%ignore osgDB::Registry::findDataFileImplementation;
%ignore osgDB::Registry::getReaderWriterForMimeType;
%ignore osgDB::Registry::addMimeTypeExtensionMapping;
%ignore osgDB::Registry::createLibraryNameForNodeKit;
%ignore osgDB::Registry::getReaderWriterForExtension;
%ignore osgDB::Registry::createLibraryNameForExtension;
%ignore osgDB::Registry::findLibraryFileImplementation;
%ignore osgDB::Registry::getImageProcessorForExtension;
%ignore osgDB::Registry::readHeightFieldImplementation;
%ignore osgDB::Registry::writeHeightFieldImplementation;
%ignore osgDB::Registry::readPluginAliasConfigurationFile;
%ignore osgDB::Registry::getReaderWriterForProtocolAndExtension;
%ignore osgDB::copyFile;
%ignore osgDB::fileType;
%ignore osgDB::FileCache::loadDatabaseRevisionsForFile;
%ignore osgDB::FileCache::FileCache;
%ignore osgDB::Output::getExternalFileWritten;
%ignore osgDB::Registry::getReaderWriterListForProtocol;
%ignore osgDB::FileCache::isCachedFileBlackListed;

%ignore setDataFilePathList;
%ignore setLibraryFilePathList;
%ignore osgDB::Registry;

// #endif // SWIGMAC


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

%include std_deque.i
%include stl.i

%include typemaps.i

%include osg_header.i
%import osg.i

/* instantiate the required template specializations */
%template() std::vector<std::string>;    
 
namespace std
{
        %template(stdFilePathList) deque<string>;
}

#ifdef SWIGPYTHON
%typemap(out) osgDB::FilePathList {
    $result = PyList_New(0);
        
        if ($result == 0) return NULL;
    
    for (osgDB::FilePathList::iterator i = $1.begin(); i != $1.end(); ++i) 
        {
                PyObject * str = PyString_FromString((*i).c_str());
                if (str == 0) return NULL;
                if (PyList_Append($result, str) == -1) return NULL;
    }
}
#endif

%{

#include <osg/Version>

#include <osg/BlendFunc>
#include <osg/BlendEquation>
#include <osg/BlendColor>

#include <osgDB/Version>
#if (OPENSCENEGRAPH_SOVERSION > 40)
#include <osgDB/AuthenticationMap>
#include <osgDB/FileCache>
#endif
#include <osgDB/DatabasePager>
#include <osgDB/Registry>
#include <osgDB/WriteFile>
#include <osgDB/SharedStateManager>
#include <osgDB/ReadFile>
#include <osgDB/ReaderWriter>
#include <osgDB/Output>
#include <osgDB/ParameterOutput>
#include <osgDB/Input>
#include <osgDB/ImageOptions>
#include <osgDB/FileUtils>
#include <osgDB/FileNameUtils>
#if ((OPENSCENEGRAPH_SOVERSION < 63) || (OPENSCENEGRAPH_SOVERSION == 65))
#include <osgDB/FieldReaderIterator>
#include <osgDB/FieldReader>
#include <osgDB/Field>
#endif
#include <osgDB/Export>
#include <osgDB/DynamicLibrary>
#include <osgDB/DotOsgWrapper>
#include <osgDB/DatabasePager>
#include <osgDB/Archive>

#if ((OPENSCENEGRAPH_SOVERSION > 55) && (OPENSCENEGRAPH_SOVERSION != 65))
#include <osgDB/Callbacks>
#endif

using namespace osgDB;
%}



%define OSG_EXPORT
%enddef
%define OSGDB_EXPORT
%enddef

%ignore osgDB::ReaderWriter;

%ignore osgDB::Registry::getReadFileCallback;
%ignore osgDB::Registry::setReadFileCallback;
%ignore osgDB::Registry::getWriteFileCallback;
%ignore osgDB::Registry::setWriteFileCallback;

%ignore osgDB::ImageOptions::_sourceImageSamplingMode;
%ignore osgDB::ImageOptions::_sourceImageWindowMode;
%ignore osgDB::ImageOptions::_sourceRatioWindow;
%ignore osgDB::ImageOptions::_sourcePixelWindow;
%ignore osgDB::ImageOptions::_destinationImageWindowMode;
%ignore osgDB::ImageOptions::_destinationRatioWindow;
%ignore osgDB::ImageOptions::_destinationPixelWindow;

%ignore osgDB::Archive::readObject;
%ignore osgDB::Archive::readImage;
%ignore osgDB::Archive::readHeightField;
%ignore osgDB::Archive::readNode;

%ignore osgDB::Archive::writeObject;
%ignore osgDB::Archive::writeImage;
%ignore osgDB::Archive::writeHeightField;
%ignore osgDB::Archive::writeNode;

%ignore osgDB::Input::read;

%ignore osgDB::DatabasePager::DatabaseThread;
%ignore osgDB::DatabasePager::getDatabaseThread;
%ignore osgDB::DatabasePager::getNumDatabaseThreads;
%ignore osgDB::DatabasePager::addDatabaseThread;


%include osg/Version
%include osgDB/Version
%include osgDB/Export

#if (OPENSCENEGRAPH_SOVERSION > 40)
%include osgDB/AuthenticationMap
%include osgDB/FileCache
#endif

%include osgDB/ReaderWriter
%include osgDB/WriteFile
%include osgDB/SharedStateManager

%typemap(out) osg::Node* {
    //  osgDB::readNodeFile(s) returns a raw Node* with 0 reference count.
    //  custom typemap to ensure a target-language-owned Node object, while increasing reference counting
    //  alternative to %newobject directive, because reference counting had to be included (?)
    if ($1)
    {
        $result = SWIG_NewPointerObj((void*)($1), $1_descriptor, SWIG_POINTER_OWN | 0);
        $1->ref();
#ifdef OSGSWIGDEBUG
        printf("osgDB::$symname:: Typemap Ref for Obj %x\n",$result);
#endif //OSGSWIGDEBUG
    }
    else
    {
        SWIG_exception(SWIG_IOError,"osgDB::$symname:: Could not load file");
    }
}
 
%include osgDB/ReadFile
%typemap(out) osg::Node*;   //resets the typemap

#if ((OPENSCENEGRAPH_SOVERSION < 63) || (OPENSCENEGRAPH_SOVERSION == 65))
%include osgDB/Field
%include osgDB/FieldReader
%include osgDB/FieldReaderIterator
#endif

%include osgDB/Input
%include osgDB/Output
%include osgDB/ParameterOutput
%include osgDB/Input
%include osgDB/ImageOptions
%include osgDB/FileUtils
%include osgDB/FileNameUtils
%include osgDB/DynamicLibrary
%include osgDB/DatabasePager
%include osgDB/Archive
%include osgDB/DotOsgWrapper
%include osgDB/Registry
