//
//  LandscapeViewController.swift
//  AlternateViews
//
//  Created by ajay singh thakur on 17/05/16.
//  Copyright © 2016 ajay singh thakur. All rights reserved.
//

import UIKit

protocol LandscapeView: class {
    func forceDismissviewController(value : Bool)
}

class LandscapeViewController: UIViewController {

     weak var delegate: LandscapeView? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.closedFullScreen(sender:)), name: NSNotification.Name.UIWindowDidBecomeHidden, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
  override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
    return UIInterfaceOrientationMask.landscapeLeft
  }
  
  @IBAction func forcePortrait(_ sender: AnyObject) {
    
    let value = UIInterfaceOrientation.portrait.rawValue
    UIDevice.current.setValue(value, forKey: "orientation")
  }
    
    func closedFullScreen(sender: NSNotification) {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        delegate?.forceDismissviewController(value: true)
    }
  

}
