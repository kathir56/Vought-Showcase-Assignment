//
//  IntermediateViewController.swift
//  Vought Showcase
//
//  Created by Kathiravan Murali on 14/09/24.
//
import UIKit

class IntermediateViewController: UIViewController {

    // Create the button
    private var actionButtonView = ActionButtonView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up the button on the view
        actionButtonView.actionDelegate = self
        setupButton()
        view.backgroundColor = .systemGroupedBackground
        title = "Flobiz"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // Function to set up the button with constraints and styling
    func setupButton() {
        
        view.addSubview(actionButtonView)
        actionButtonView.translatesAutoresizingMaskIntoConstraints = false
        actionButtonView.layer.cornerRadius = 16
        actionButtonView.layer.shadowColor = UIColor.black.cgColor
        NSLayoutConstraint.activate([
            actionButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButtonView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            actionButtonView.widthAnchor.constraint(equalToConstant: 300),
            actionButtonView.heightAnchor.constraint(equalToConstant: 300),
            
        ])
    }
}

extension IntermediateViewController : ActionButtonViewDelegate
{
    
    func boysFunction() {
        
        let boysViewController = BoysViewController()
        boysViewController.modalPresentationStyle = .pageSheet
        present(boysViewController, animated: true)
    }
    
    func carouselFunction() {
        
        // Create a carousel item provider
        let carouselItemProvider = CarouselItemDataSourceProvider()
        
        // Create carouselViewController
        let carouselViewController = CarouselViewController(items: carouselItemProvider.items())

        carouselViewController.modalPresentationStyle = .formSheet // Optional: Present FormSheet
        carouselViewController.title = "Seven Members"
        navigationController?.pushViewController(carouselViewController, animated: true)
    }
    
    
}
