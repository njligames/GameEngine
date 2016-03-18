
#include "Log.h"
#define TAG "Game.cpp"
#include "AbstractRender.h"
#include "GLPlatform.h"
#include "Game.h"
#include "World.h"

#ifdef __ANDROID__
#else
#include <sys/sysctl.h>
#include <sys/types.h>
#endif

namespace njli {

bool NJLIGameEngine::isIOS() { return platformID() == PlatformID_iOS; }

bool NJLIGameEngine::isANDROID() { return platformID() == PlatformID_Android; }

bool NJLIGameEngine::isEMSCRIPTEN()
{
    return platformID() == PlatformID_Emscripten;
}

bool NJLIGameEngine::isMACOSX() { return platformID() == PlatformID_MacOSx; }

bool NJLIGameEngine::create(const char* deviceName)
{
    const char* android_private = "";
    const char* android_argument = "";
    const char* python_home = "";
    const char* python_path = "";
    const char* arg = "";

    setenv("ANDROID_PRIVATE", android_private, 1);
    setenv("ANDROID_ARGUMENT", android_argument, 1);
    setenv("PYTHONOPTIMIZE", "2", 1);
    setenv("PYTHONHOME", python_home, 1);
    setenv("PYTHONPATH", python_path, 1);
    setenv("PYTHON_SERVICE_ARGUMENT", arg, 1);

    if (LOGGING_ON) {
        const char* platform = (isIOS()
                ? "iOS"
                : (isANDROID()
                          ? "Android"
                          : (isEMSCRIPTEN()
                                    ? "Emscripten"
                                    : ((isMACOSX() ? "MacOSx" : "UNKNOWN_PLATFORM")))));
        DEBUG_LOG_V(TAG, "Platform Name = `%s`\n", platform);
        DEBUG_LOG_V(TAG, "Device Name = `%s`\n", deviceName);

        //        printGLInfo();
        printGLInfo();
    }

    initGL();

    njli::World::createInstance();

    //    njli::World::getInstance()->getWorldResourceLoader()->loadZip("Archive.zip");

    njli::World::getInstance()->setDeviceName(deviceName);

    //#if defined(DEBUG) || defined (_DEBUG)
    //    njli::World::getInstance()->getWorldLuaVirtualMachine()->loadFile(ASSET_PATH("scripts/start.lua"));
    //#else
    njli::World::getInstance()->getWorldLuaVirtualMachine()->loadFile(
        "scripts/main.lua");
    //#endif
    njli::World::getInstance()->getWorldClock()->reset();

    njli::World::getInstance()->getWorldLuaVirtualMachine()->compile();

    return true;
}
bool NJLIGameEngine::create(int x, int y, int width, int height,
    int orientation, const char* deviceName, bool initLua)
{
    if(initLua)
        njli::World::getInstance()->getWorldLuaVirtualMachine()->init();
    
    resize(x, y, width, height, orientation);
    create(deviceName);

    return true;
}

void NJLIGameEngine::resize(int x, int y, int width, int height,
    int orientation)
{
    njli::World::getInstance()->resize(width, height, orientation);
}

void NJLIGameEngine::update(float step)
{
    BT_PROFILE("Game update");
    njli::World::getInstance()->update(step, 3);
}

void NJLIGameEngine::render() { njli::World::getInstance()->render(); }

void NJLIGameEngine::destroy() { njli::World::destroyInstance(); }

void NJLIGameEngine::setTouch(const void* touch, const int index,
    const unsigned long num_touches)
{
    //    DEBUG_LOG_V("Game.cpp", "set_touch(%s)\n", "?");
    njli::World::getInstance()->getWorldInput()->setTouch(touch, index,
        num_touches);
}
void NJLIGameEngine::setTouch(const int x, const int y, const int index,
    const unsigned long num_touches, float scaleFactor)
{
    //    DEBUG_LOG_V("Game.cpp", "set_touch(%d, %d, %d, %d, %f)\n", x, y, index,
    //    num_touches, scaleFactor);
    int xx = (x < 0)
        ? 0
        : ((x > njli::World::getInstance()->getViewportDimensions().x())
                  ? njli::World::getInstance()->getViewportDimensions().x()
                  : x);
    int yy = (y < 0)
        ? 0
        : ((y > njli::World::getInstance()->getViewportDimensions().y())
                  ? njli::World::getInstance()->getViewportDimensions().y()
                  : y);

    njli::World::getInstance()->getWorldInput()->setTouch(
        xx, yy, index, num_touches, scaleFactor);
}

void NJLIGameEngine::clearNodeTouches()
{
    njli::World::getInstance()->getWorldInput()->clearNodeTouches();
}

void NJLIGameEngine::touchDown()
{
    //    DEBUG_LOG_V("Game.cpp", "touch_down(%s)\n", "");
    njli::World::getInstance()->getWorldInput()->touchDown();
}
void NJLIGameEngine::touchUp()
{
    //    DEBUG_LOG_V("Game.cpp", "touch_up(%s)\n", "");
    njli::World::getInstance()->getWorldInput()->touchUp();
}
void NJLIGameEngine::touchMove()
{
    //    DEBUG_LOG_V("Game.cpp", "touch_move(%s)\n", "");
    njli::World::getInstance()->getWorldInput()->touchMove();
}
void NJLIGameEngine::touchCancelled()
{
    njli::World::getInstance()->getWorldInput()->touchCancelled();
}

void NJLIGameEngine::pauseGame()
{
    njli::World::getInstance()->enablePauseGame();
}

void NJLIGameEngine::unpauseGame()
{
    njli::World::getInstance()->enablePauseGame(false);
}

void NJLIGameEngine::pauseSound()
{
    njli::World::getInstance()->getWorldSound()->enableSuspend();
}

void NJLIGameEngine::unpauseSound()
{
    njli::World::getInstance()->getWorldSound()->enableSuspend(false);
}

void NJLIGameEngine::keyboardShow()
{
    char buffer[256];
    sprintf(buffer, "%s", "KeyboardShow");
    njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer);
}

void NJLIGameEngine::keyboardCancel()
{
    char buffer[256];
    sprintf(buffer, "%s", "KeyboardCancel");
    njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer);
}

void NJLIGameEngine::keyboardReturn(const char* text)
{
    char buffer[256];
    sprintf(buffer, "%s", "KeyboardReturn");

    njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer, text);
}
}
