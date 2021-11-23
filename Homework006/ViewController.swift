//
//  ViewController.swift
//  Homework006
//
//  Created by Chun-Yi Lin on 2021/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoPageControl: UIPageControl!
    @IBOutlet weak var photoSegment: UISegmentedControl!
    @IBOutlet weak var photoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseNumber ()
        
    }
    let photoImages = ["Spring", "Summer", "Fall", "Winter"]
    let photoLabels = ["Thriving", "Fertile", "Bloom", "Withered"]
    var selectedNumber : Int = 0
    
    func chooseNumber () {
        photoImageView.image = UIImage(named: photoImages[selectedNumber])
        photoPageControl.currentPage = selectedNumber
        photoSegment.selectedSegmentIndex = selectedNumber
        photoLabel.text = photoLabels[selectedNumber]
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        selectedNumber = sender.currentPage
        chooseNumber ()
    }
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        selectedNumber = sender.selectedSegmentIndex
        chooseNumber ()
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        switch selectedNumber {
        case 0: selectedNumber = photoImages.count-1
        default: selectedNumber -= 1
        }
        chooseNumber ()
    }
    
    @IBAction func forwardClicked(_ sender: UIButton) {
        switch selectedNumber {
        case photoImages.count-1: selectedNumber = 0
        default: selectedNumber += 1
        }
        chooseNumber ()
    }
    
    @IBAction func backSwipe(_ sender: UISwipeGestureRecognizer) {
        switch selectedNumber {
        case 0: selectedNumber = photoImages.count-1
        default: selectedNumber -= 1
        }
        chooseNumber ()
    }
    
    @IBAction func forwardSwipe(_ sender: UISwipeGestureRecognizer) {
        switch selectedNumber {
        case photoImages.count-1: selectedNumber = 0
        default: selectedNumber += 1
        }
        chooseNumber ()
    }
    
    @IBAction func randomClicked(_ sender: UILongPressGestureRecognizer) {
        selectedNumber = Int.random(in: 0...photoImages.count-1)
        chooseNumber ()
    }
    
    
}

