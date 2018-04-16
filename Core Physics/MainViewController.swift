//
//  MainViewController.swift
//
//  Created by Jon Kent on 11/12/15.
//  Copyright © 2015 Jon Kent. All rights reserved.
//

import SideMenu

class MainViewController: UIViewController, TableDataDelegate {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSideMenu()
    }
    
    fileprivate func setupSideMenu() {
        // Define the menus
        SideMenuManager.default.menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? UISideMenuNavigationController
        SideMenuManager.default.menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "RightMenuNavigationController") as? UISideMenuNavigationController
        
        // Customise the menus
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuBlurEffectStyle = .dark
        SideMenuManager.default.menuAnimationFadeStrength = 0.5
        SideMenuManager.default.menuShadowOpacity = 0.1
        SideMenuManager.default.menuAnimationTransformScaleFactor = 0.7
        SideMenuManager.default.menuWidth = view.frame.width * 0.4
        SideMenuManager.default.menuAnimationBackgroundColor = UIColor(patternImage: UIImage(named: "background")!)
    }

    // Implement the protocol's function
    func dataTransfer(data: Int) {
        label.text = "\(data)"
    }
    
    // Prepare for segue with navigation view controller and delegate
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSideMenu" {
            let sideMenuTableViewController = segue.destination as! UINavigationController
            let destinatioViewController = sideMenuTableViewController.viewControllers.first as! SideMenuTableViewController
            destinatioViewController.delegate = self
            
        }
    }
}

