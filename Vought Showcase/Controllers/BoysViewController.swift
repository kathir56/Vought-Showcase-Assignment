//
//  BoysViewController.swift
//  Vought Showcase
//
//  Created by Kathiravan Murali on 14/09/24.
//

import UIKit

class BoysViewController: UIViewController, SegmentedProgressBarDelegate {

    // SegmentedProgressBar instance
    private var segmentedProgBar: SegmentedProgressBar!
    
    
    private let imgView = UIImageView()
    
    
    private let images = [
        UIImage(named: "butcher"),
        UIImage(named: "hughei"),
        UIImage(named: "frenchie"),
        UIImage(named: "mm")
    ]
    
    // Flag to ensure the progress bar starts once the view appears
    private var isInitialAnimationStarted = false

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white

        // Setup the image view properties
        imgView.frame = view.bounds
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true
        view.addSubview(imgView)
        updateImage(index: 0)

        
        // Initialize the segmented progress bar
        segmentedProgBar = SegmentedProgressBar(numberOfSegments: images.count, duration: 5)
        segmentedProgBar.frame = CGRect(x: 15, y: 60, width: view.frame.width - 30, height: 4)
        segmentedProgBar.delegate = self
        segmentedProgBar.topColor = UIColor.white
        segmentedProgBar.bottomColor = UIColor.white.withAlphaComponent(0.25)
        segmentedProgBar.padding = 2
        view.addSubview(segmentedProgBar)

        // Long press gesture to pause/resume the progress bar
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(tappedView))
        view.addGestureRecognizer(longPressGesture)

        // Gesture areas for left and right taps (for rewind/skip functionality)
        setupTapGestures()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Ensure the progress bar starts only when the view is fully visible
        if !isInitialAnimationStarted {
            segmentedProgBar.startAnimation()
            isInitialAnimationStarted = true
        }
    }

    // Hide the status bar for full-screen experience
    override var prefersStatusBarHidden: Bool {
        return true
    }

    // Delegate method: called when the progress bar changes segment (index)
    func segmentedProgressBarChangedIndex(index: Int) {
        
        updateImage(index: index)
    }

    // Delegate method: called when the progress bar finishes all segments
    func segmentedProgressBarFinished() {
        
        dismiss(animated: true)
    }

    // Method to handle long press gestures to pause/resume the progress bar
    @objc private func tappedView(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            segmentedProgBar.isPaused = true
        }
        if sender.state == .ended {
            segmentedProgBar.isPaused = false
        }
    }

    // Helper method to update the displayed image with a smooth transition
    private func updateImage(index: Int) {
        
        UIView.transition(with: imgView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.imgView.image = self.images[index]
        }, completion: nil)
    }

    
    @objc private func leftTapped() {
        segmentedProgBar.rewind()
    }

    @objc private func rightTapped() {
        segmentedProgBar.skip()
    }

    // Helper method to setup the gesture recognizers for left and right taps
    private func setupTapGestures() {
    
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width / 2, height: view.frame.height))
        
        let rightView = UIView(frame: CGRect(x: view.frame.width / 2, y: 0, width: view.frame.width / 2, height: view.frame.height))

        leftView.backgroundColor = .clear
        rightView.backgroundColor = .clear

        let leftTapGesture = UITapGestureRecognizer(target: self, action: #selector(leftTapped))
        leftView.addGestureRecognizer(leftTapGesture)

        let rightTapGesture = UITapGestureRecognizer(target: self, action: #selector(rightTapped))
        rightView.addGestureRecognizer(rightTapGesture)

        
        view.addSubview(leftView)
        view.addSubview(rightView)
    }
}
