//
//  GameViewController.swift
//  NJLIGameEngine
//
//  Created by James Folk on 9/5/16.
//  Copyright © 2016 NJLIGames Ltd. All rights reserved.
//

import GLKit
import OpenGLES

class GameViewController: GLKViewController {
    
    var context: EAGLContext? = nil
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    deinit {
        self.tearDownGL()
        
        if EAGLContext.currentContext() === self.context {
            EAGLContext.setCurrentContext(nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.context = EAGLContext(API: .OpenGLES2)
        
        if !(self.context != nil) {
            print("Failed to create ES context")
        }
        
        let view = self.view as! GLKView
        view.context = self.context!
        view.drawableDepthFormat = .Format24
        
        self.setupGL()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        if self.isViewLoaded() && (self.view.window != nil) {
            self.view = nil
            
            self.tearDownGL()
            
            if EAGLContext.currentContext() === self.context {
                EAGLContext.setCurrentContext(nil)
            }
            self.context = nil
        }
    }
    
    func setupGL() {
        EAGLContext.setCurrentContext(self.context)
        
        let view = self.view as! GLKView
        appDelegate.njliGameEngine.create(view)
    }
    
    func tearDownGL() {
        EAGLContext.setCurrentContext(self.context)
        
        appDelegate.njliGameEngine.destroy()
    }
    
    // MARK: - GLKView and GLKViewController delegate methods
    
    func update() {
        appDelegate.njliGameEngine.update(self.timeSinceLastUpdate)
    }
    
    override func glkView(view: GLKView, drawInRect rect: CGRect) {
        appDelegate.njliGameEngine.render()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        appDelegate.njliGameEngine.touchDown(touches)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        appDelegate.njliGameEngine.touchUp(touches)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        appDelegate.njliGameEngine.touchMove(touches)
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        appDelegate.njliGameEngine.touchCancelled(touches)
    }
}
