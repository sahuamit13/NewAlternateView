//
//  NavigationController.swift
//  AlternateViews
//
//  Created by ajay singh thakur on 17/05/16.
//  Copyright © 2016 ajay singh thakur. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
//  - (NSUInteger)supportedInterfaceOrientations
//  {
//  return [self.topViewController supportedInterfaceOrientations];
//  }
  
  override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
    return (self.topViewController?.supportedInterfaceOrientations
      )!
  }

}
