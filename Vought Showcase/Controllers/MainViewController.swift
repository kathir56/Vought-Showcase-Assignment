//
//  ViewController.swift
//  Vought Showcase
//
//  Created by Burhanuddin Rampurawala on 06/08/24.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initCarouselView()
    }
    
    private func initCarouselView() {
                
        // Add carousel view controller in container view
        add(asChildViewController: UINavigationController(rootViewController: IntermediateViewController()), containerView: containerView)
    }
    
}

