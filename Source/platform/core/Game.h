#ifndef __JLIGameEngineTest__Game__
#define __JLIGameEngineTest__Game__

namespace njli {
class NJLIGameEngine {
public:
    static bool isIOS();
    static bool isANDROID();
    static bool isEMSCRIPTEN();
    static bool isMACOSX();
    static bool isTVOS();

    static bool create(const char* deviceName);
    static bool create(int x, int y, int width, int height, int orientation, const char* deviceName, bool initLua = true);
    static void resize(int x, int y, int width, int height, int orientation);
    static void update(float step);
    static void render();
    static void destroy();

    static void setTouch(const void* touch, const int index, const unsigned long num_touches);
    static void setTouch(const int x, const int y, const int index, const unsigned long num_touches, float scaleFactor);

    static void clearNodeTouches();

    static void touchDown();
    static void touchUp();
    static void touchMove();
    static void touchCancelled();

    static void pauseGame();
    static void unpauseGame();

    static void pauseSound();
    static void unpauseSound();

    static void keyboardShow();
    static void keyboardCancel();
    static void keyboardReturn(const char* text);

    enum PlatformID {
        PlatformID_iOS = 0,
        PlatformID_Android,
        PlatformID_Emscripten,
        PlatformID_MacOSx,
        PlatformID_tvOS
    };

    static PlatformID platformID();

protected:
private:
};
}

#endif
