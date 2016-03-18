//
//  main.cpp
//  macOSx
//
//  Created by James Folk on 3/18/16.
//  Copyright © 2016 NJLIGames Ltd. All rights reserved.
//

#import <NJLIGameEngine_macOSx/NJLIGameEngine_macOSx.h>
#include <GLUT/glut.h>

//#include "Game.h"
//#include "Log.h"
//#include "World.h"

static int win = 0;
static int elapsedUSecs = 1;
static int enterCode = 0;

clock_t lastTime = clock();

static void display_njli()
{
    njli::NJLIGameEngine::render();
    
    glutSwapBuffers();
}

static void reshape_njli(int w, int h)
{
    njli::NJLIGameEngine::resize(0, 0, w, h, 0);
}

static void mouse_njli(int button, int state, int x, int y)
{
    glutPostRedisplay();
}

static void keyboard_njli(unsigned char k, int x, int y)
{
    switch ( k )
    {
        case 27: // Escape key
            glutDestroyWindow ( win );
            exit (0);
            break;
        case 'p':
            enterCode = 1;
            break;
    }
    glutPostRedisplay();
}

static void idle_njli(void)
{
    clock_t currentTime = clock();
    double timeStep = (currentTime - lastTime) / (double)(CLOCKS_PER_SEC);
    lastTime = currentTime;
    
    
    njli::NJLIGameEngine::update(timeStep);
    
}

static void timerCallback_njli (int value)
{
    if(enterCode)
    {
        enterCode = 0;
    }
    
    
    /* call back again after elapsedUSecs have passed */
    glutTimerFunc (elapsedUSecs, timerCallback_njli, value);
}

int main(int argc,  char * argv[])
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_ALPHA | GLUT_DEPTH);
    glutInitWindowSize (250, 250);
    glutInitWindowPosition (100, 100);
    win = glutCreateWindow ("NJLIGameEngine");
    glutDisplayFunc(display_njli);
    glutReshapeFunc(reshape_njli);
    glutMouseFunc(mouse_njli);
    glutKeyboardFunc(keyboard_njli);
    glutIdleFunc(idle_njli);
    glutTimerFunc (elapsedUSecs, timerCallback_njli, 0);
    
    njli::NJLIGameEngine::create(0, 0, 250, 250, 0, "MAC", true);
    
    glutMainLoop();
    
    return 0;
}
