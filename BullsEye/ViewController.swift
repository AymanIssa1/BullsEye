//
//  ViewController.swift
//  BullsEye
//
//  Created by LinuxPlus on 4/8/17.
//  Copyright © 2017 LinuxPlus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var score:Int = 0
    var level:Int = 1
    
    var sliderValue:Int = 1
    
    @IBOutlet var mySlider:UISlider!
    @IBOutlet var targetLabel:UILabel!
    @IBOutlet var scoreLabel:UILabel!
    @IBOutlet var roundLabel:UILabel!
    
    var targetValue:Int = 0    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func showAlert(){
        var title:String = ""
        
        if sliderValue == targetValue {
            score += 100
            title = "perfect"
        } else if alwaysPositiveNumber(number: sliderValue - targetValue) <= 5{
            score += 50
            title = "You almost had it"
        } else if alwaysPositiveNumber(number: sliderValue - targetValue) <= 10{
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        let alert = UIAlertController(title: title, message: "You Scored \(String(score))\nYour value is \(String(sliderValue)) \nThe target is \(targetValue)", preferredStyle: .actionSheet)
        
        let action = UIAlertAction(title: "OK", style: .default
            , handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
        level += 1
        
        startNewRound()
    }
    
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        sliderValue = Int(mySlider.value)
        
        print("The value of the slider is \(slider.value)")
        
//        slilderValueLabel.text = String(currentValue)
    }
    
    func startNewRound() -> Void{
        targetValue = 1 + Int(arc4random_uniform(100))
        mySlider.value = 0
        
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(level)
    }
    
    func alwaysPositiveNumber(number:Int) -> Int {
        if(number < 0) {
            return number * -1
        } else {
            return number
        }
    }

    


}

