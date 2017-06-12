//
//  PortraitViewController.swift
//  AlternateViews
//
//  Created by ajay singh thakur on 17/05/16.
//  Copyright © 2016 ajay singh thakur. All rights reserved.
//

import UIKit

class PortraitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      UIDevice.current.beginGeneratingDeviceOrientationNotifications()
     NotificationCenter.default.addObserver(self, selector: #selector(PortraitViewController.onDeviceOrientationDidChange(_:)), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
    return UIInterfaceOrientationMask.portrait
  }

  deinit {
  
    NotificationCenter.default.removeObserver(self)
    UIDevice.current.endGeneratingDeviceOrientationNotifications()
  }
  
  
  // button --
  @IBAction func forceLandscape(_ sender: AnyObject) {
    let value = UIInterfaceOrientation.landscapeLeft.rawValue
    UIDevice.current.setValue(value, forKey: "orientation")
    
  }
 
  
  
}

extension PortraitViewController {

  func onDeviceOrientationDidChange(_ notification: Notification) {
    // A delay must be added here, otherwise the new view will be swapped in
    // too quickly resulting in an animation glitch
    self.perform(#selector(PortraitViewController.updateLandscapeView), with: nil, afterDelay: 0)
  }

  func updateLandscapeView() {
    // Get the device's current orientation.  By the time the
    // UIDeviceOrientationDidChangeNotification has been posted, this value
    // reflects the new orientation of the device.
    let deviceOrientation: UIDeviceOrientation = UIDevice.current.orientation
    if UIDeviceOrientationIsLandscape(deviceOrientation) && self.presentedViewController == nil {
      // Trigger the segue to present LandscapeViewController modally.
      self.performSegue(withIdentifier: "PresentLandscapeViewControllerSegue", sender: self)
    }
    else if deviceOrientation == .portrait && self.presentedViewController != nil {
      self.dismiss(animated: true, completion: { _ in })
    }
    
  }
}
