//
//  ActionButtonView.swift
//  Vought Showcase
//
//  Created by Kathiravan Murali on 14/09/24.
//

import UIKit

// Protocol to define delegate methods for button actions
protocol ActionButtonViewDelegate : AnyObject
{
    func boysFunction()
    func carouselFunction()
}


class ActionButtonView: UIView {
   
    // Weak reference to the delegate to avoid retain cycles
    weak var actionDelegate : ActionButtonViewDelegate?

    // UIButton for "The Boys" with custom styling
    var boysButton : UIButton =
    {
        let button = UIButton(type: .system)
        button.setTitle("The Boys", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return button
    }()
    
    
    // UIButton for "Carousel" with custom styling
    var carouselButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Seven Members", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return button
    }()
    
    // Custom initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        addSubview(boysButton)
        NSLayoutConstraint.activate([
            boysButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            boysButton.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -25),
            boysButton.widthAnchor.constraint(equalToConstant: 200),
            boysButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        addSubview(carouselButton)
        NSLayoutConstraint.activate([
            carouselButton.topAnchor.constraint(equalTo: boysButton.bottomAnchor, constant: 30),
            carouselButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            carouselButton.widthAnchor.constraint(equalToConstant: 200),
            carouselButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        boysButton.addTarget(self, action: #selector(boysButtonTapped), for: .touchUpInside)
        carouselButton.addTarget(self, action: #selector(carouseButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Action for when "The Boys" button is tapped
    @objc func boysButtonTapped()
    {
    
        actionDelegate?.boysFunction()
    }
    
    // Action for when "Carousel" button is tapped
    @objc func carouseButtonTapped()
    {
        actionDelegate?.carouselFunction()
    }
    
    
}
