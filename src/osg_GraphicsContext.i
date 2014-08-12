/*
osg_GraphicsContext.i - defines "global" versions of nested classes in osg::GraphicsContext
*/

%ignore osg::GraphicsContext::add;
%ignore osg::GraphicsContext::remove;
%ignore osg::GraphicsContext::getCurrentOperation;
%ignore osg::GraphicsContext::setCreateGraphicsContextCallback;
%ignore osg::GraphicsContext::getCreateGraphicsContextCallback;
%ignore osg::GraphicsContext::setResizedCallback;
%ignore osg::GraphicsContext::getResizedCallback;

%include osg/GraphicsContext
struct SwapCallback : public osg::Referenced
{
    virtual void swapBuffersImplementation(osg::GraphicsContext* gc) = 0;
};
        
%{
using namespace osg;
%}

struct ScreenIdentifier
{
    ScreenIdentifier();
    ScreenIdentifier(int in_screenNum);
    ScreenIdentifier(const std::string& in_hostName,int in_displayNum, int in_screenNum);
    std::string displayName() const;
    void readDISPLAY();
    void setScreenIdentifier(const std::string& displayName);
    void setUndefinedScreenDetailsToDefaultScreen();
    std::string  hostName;
    int displayNum;
    int screenNum;
};

struct Traits : public osg::Referenced, public ScreenIdentifier
{
    Traits(DisplaySettings* ds=0);

    // graphics context original and size
    int x;
    int y;
    int width;
    int height;

    // window decoration and behaviour
    std::string windowName;
    bool        windowDecoration;
    bool        supportsResize;

    // buffer depths, 0 equals off.
    unsigned int red;
    unsigned int blue;
    unsigned int green;
    unsigned int alpha;
    unsigned int depth;
    unsigned int stencil;

    // multi sample parameters
    unsigned int sampleBuffers;
    unsigned int samples;

    // buffer configuration
    bool pbuffer;
    bool quadBufferStereo;
    bool doubleBuffer;

    // render to texture
    GLenum          target;
    GLenum          format;
    unsigned int    level;
    unsigned int    face;
    unsigned int    mipMapGeneration;

    // V-sync
    bool            vsync;

    // Swap Group
    bool            swapGroupEnabled;
    GLuint          swapGroup;
    GLuint          swapBarrier;

    // use multithreaded OpenGL-engine (OS X only)
    bool            useMultiThreadedOpenGLEngine;

    // enable cursor
    bool            useCursor;

    // settings used in set up of graphics context, only presently used by GL3 build of OSG.
    std::string     glContextVersion;
    unsigned int    glContextFlags;
    unsigned int    glContextProfileMask;

    /** return true if glContextVersion is set in the form major.minor, and assign the appropriate major and minor values to the associated parameters.*/
    bool getContextVersion(unsigned int& major, unsigned int& minor) const;

    // shared context
    osg::observer_ptr<GraphicsContext> sharedContext;

    osg::ref_ptr<osg::Referenced> inheritedWindowData;

    // ask the GraphicsWindow implementation to set the pixel format of an inherited window
    bool setInheritedWindowPixelFormat;

    // X11 hint whether to override the window managers window size/position redirection
    bool overrideRedirect;

    DisplaySettings::SwapMethod swapMethod;
};

struct WindowingSystemInterface : public osg::Referenced
{
    virtual unsigned int getNumScreens(const ScreenIdentifier& screenIdentifier = ScreenIdentifier()) = 0;
    virtual void getScreenResolution(const ScreenIdentifier& screenIdentifier, unsigned int& width, unsigned int& height) = 0;
    virtual bool setScreenResolution(const ScreenIdentifier& /*screenIdentifier*/, unsigned int /*width*/, unsigned int /*height*/) { return false; }
    virtual bool setScreenRefreshRate(const ScreenIdentifier& /*screenIdentifier*/, double /*refreshRate*/) { return false; }
    virtual GraphicsContext* createGraphicsContext(Traits* traits) = 0;
    virtual ~WindowingSystemInterface() {};
};

#ifdef SWIGPYTHON
%pythoncode %{
#get the original definitions back into their classes
GraphicsContext.Traits = Traits
GraphicsContext.ScreenIdentifier = ScreenIdentifier
GraphicsContext.WindowingSystemInterface = WindowingSystemInterface
GraphicsContext.SwapCallback = SwapCallback
%}
#endif