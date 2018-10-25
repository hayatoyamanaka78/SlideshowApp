//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 山中敬人 on 2018/10/21.
//  Copyright © 2018年 hayato.yamanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIButton!
    
    
    
    
    @IBAction func move(_ sender: Any) {
        dispImageNo += 1
        
        displayImage()
    }
    
    
    
    @IBAction func `return`(_ sender: Any) {
        dispImageNo -= 1
        
        displayImage()
    }
    
    var dispImageNo = 0
    
     var name: String?
   
    func displayImage() {
        
        
        let imageNameArray = [
            "image1",
            "image2",
            "image3",
            ]
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        if dispImageNo > 2 {
            dispImageNo = 0
        }
     self.name = imageNameArray[dispImageNo]
       
        
        let image = UIImage(named: name!)
        imageView.setImage(image,for: .normal)
    }
 
   
    var timer: Timer!
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named:"image1_image2_image3")
        imageView.setImage(image,for: .normal)
        
        
    }
    
    @objc func updateTimer(_ timer: Timer) {
        
        
        dispImageNo += 1
        
        displayImage()
        
        
        
    }
    
    
    @IBOutlet weak var button: UIButton!
    
    
    @IBOutlet weak var butto2: UIButton!
    
    
    
    @IBOutlet weak var stsrtatopButton: UIButton!
    
    
    
    
    @IBAction func startstop(_ sender: Any) {
        
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            button.isEnabled = false
            butto2.isEnabled = false
            stsrtatopButton.setTitle("停止", for: UIControlState.normal)
            
            
            
        }
        else if self.timer != nil{
            self.timer.invalidate()
            self.timer = nil
            button.isEnabled = true
            butto2.isEnabled = true
            stsrtatopButton.setTitle("再生", for: UIControlState.normal)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC: secondViewController = segue.destination as! secondViewController
        secondVC.image = UIImage(named: name!)
      }
    @IBAction func second(_segue: UIStoryboardSegue) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
