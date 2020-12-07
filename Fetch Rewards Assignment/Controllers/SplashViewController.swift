//
//  SplashViewController.swift
//  Fetch Rewards Assignment
//
//  Created by Latheeshwarraj Mohanraj on 10/28/20.
//  Copyright © 2020 Veg World. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigation()
        let seconds = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            let listViewController = self.storyboard!.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
            self.navigationController?.pushViewController(listViewController, animated: true)
        }
        
    }
    
    func hideNavigation(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
