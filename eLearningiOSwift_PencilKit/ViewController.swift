//
//  ViewController.swift
//  eLearningiOSwift_PencilKit
//
//  Created by Dhaval Gevariya on 10/09/20.
//  Copyright © 2020 Dhaval Gevariya. All rights reserved.
//

import UIKit
import PencilKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        DrawingViewSetup()
    }
    
    
    func DrawingViewSetup()
    {
        let DrawingView = PKCanvasView(frame: self.view.bounds)
        guard let windowsScreen = view.window , let toolbar = PKToolPicker.shared(for: windowsScreen) else { return }
        toolbar.setVisible(true, forFirstResponder: DrawingView)
        toolbar.addObserver(DrawingView)
        DrawingView.becomeFirstResponder()
        view.addSubview(DrawingView)
    }
}

//MARL:- Extension For PencilKit Delegate Methods

extension ViewController : PKCanvasViewDelegate
{
    func canvasViewDidFinishRendering(_ canvasView: PKCanvasView) {
        print("This Method is called when canvas view is rendered or Ready to Display")
    }
    func canvasViewDidBeginUsingTool(_ canvasView: PKCanvasView) {
        print("This Method is called when canvasview started a new drawing sequence with the currently selected tool")
    }
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        print("This Method is called when canvasview's contents of the current drawing changed.")
    }
    func canvasViewDidEndUsingTool(_ canvasView: PKCanvasView) {
        print("This Method is called when user ended a drawing sequence with the tool")
    }
}
