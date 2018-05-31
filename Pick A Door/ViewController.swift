//
//  ViewController.swift
//  Pick A Door
//
//  Created by Anthony Schwartz on 5/29/18.
//  Copyright © 2018 Anthony Schwartz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var buttonPressed = 0
    var goodDoor = 0
    var secondButtonPressed = 0
    var breakCode = 0
    
    @IBOutlet weak var firstChoiceImage: UIImageView!
    @IBOutlet weak var secondChoiceImage: UIImageView!
    @IBOutlet weak var thirdChoiceImage: UIImageView!
    @IBOutlet weak var topTextView: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "Welcome", message: "Pick a door and see if you land in heaven or hell!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Sounds Great!", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func startOver() {
        firstChoiceImage.image = UIImage(named: "Slice")
        secondChoiceImage.image = UIImage(named: "Slice")
        thirdChoiceImage.image = UIImage(named: "Slice")
        topTextView.text = "Choose Carefully!"
        buttonPressed = 0
        secondButtonPressed = 0
        breakCode = 0
    }
    
    func firstButtonPressed() {
        if buttonPressed == 1 {
            thirdChoiceImage.image = UIImage(named: "Bad Open Door")
        } else {
            firstChoiceImage.image = UIImage(named: "Bad Open Door")
        }
         
        topTextView.text = "Keep Original Choice?"
        topTextView.font = UIFont(name: topTextView.font.fontName, size: 16)
        topTextView.lineBreakMode = .byWordWrapping
        topTextView.numberOfLines = 3
        breakCode += 1
        return
    }
    
    func finishButtonPressed() {
        
        if secondButtonPressed == 1 || secondButtonPressed == 3 {
            if secondButtonPressed == 1 {
                firstChoiceImage.image = UIImage(named: "Bad Open Door")
                
                let alert = UIAlertController(title: "Oh No!", message: "Hell!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Once more?", style: UIAlertActionStyle.default, handler: nil))
                let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 65, height: 65))
                imageView.image = UIImage(named: "Bad Open Door")
                alert.view.addSubview(imageView)
                
                self.present(alert, animated: true, completion: startOver)
                
                
            } else {
                thirdChoiceImage.image = UIImage(named: "Bad Open Door")
                let alert = UIAlertController(title: "Oh No!", message: "Hell!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Once more?", style: UIAlertActionStyle.default, handler: nil))
                let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 70, height: 70))
                imageView.image = UIImage(named: "Bad Open Door")
                alert.view.addSubview(imageView)
                self.present(alert, animated: true, completion: startOver)
                return
                
            }
            
        } else {
            firstChoiceImage.image = UIImage(named: "Slice")
            secondChoiceImage.image = UIImage(named: "Good Open Door")
            let alert = UIAlertController(title: "Yeshhh!", message: "Heaven!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Once more?", style: UIAlertActionStyle.default, handler: nil))
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 70, height: 70))
            imageView.image = UIImage(named: "Good Open Door")
            alert.view.addSubview(imageView)
            self.present(alert, animated: true, completion: startOver)
            }
        
    }
    @IBAction func chioceOneButton(_ sender: UIButton) {
        buttonPressed += 1
        firstButtonPressed()
        
        
        if breakCode == 1 {
            return
        } else {
            secondButtonPressed += 1
            finishButtonPressed()
        }
    }
    
    @IBAction func choiceTwoButton(_ sender: UIButton) {
        buttonPressed += 2
        firstButtonPressed()
        goodDoor += 2
        
        if breakCode == 1 {
            return
        } else {
            finishButtonPressed()
        }
    }
    
    @IBAction func choiceThreeButton(_ sender: UIButton) {
        buttonPressed += 3
        firstButtonPressed()
        
        
        if breakCode == 1 {
            return
        } else {
            secondButtonPressed += 3
            finishButtonPressed()
        }
    }
    
    @IBAction func onceMoreButton(_ sender: UIButton) {
        startOver()
    }
    
}

