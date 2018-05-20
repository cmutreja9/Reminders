//
//  PomoVC.swift
//  TheReminder
//
//  Created by Chinky Mutreja on 19/5/18.
//  Copyright © 2018 Chinky Mutreja. All rights reserved.
//

import UIKit
import UserNotifications

class PomoVC: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    
    
    @IBOutlet weak var optionButton: UIButton!
    
    let times = [ "20","25","30","40"]
    var timer = Timer()
    var intCounter = 1500
    var resume = false;
    
    
    
   
    
    @IBOutlet weak var timePick: UIPickerView!
    
    let center = UNUserNotificationCenter.current()
    @IBOutlet weak var resetT: UIButton!
    @IBOutlet weak var startT: UIButton!
    
    @IBOutlet weak var exitT: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resetT.isHidden = true;
        exitT.isHidden = true;
        
        timePick.isHidden = true
        timePick.delegate = self
        timePick.dataSource = self
        
        
        // notification settings
        let content = UNMutableNotificationContent()
        content.title = "Pomodoro"
        content.body = "Hey you just successfully completed one pomodoro practice"
        content.sound = UNNotificationSound.default()
        
        //let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.sound]){ granted,error in
            
        }
        
     /*   let content = UNMutableNotificationContent()
        content.title = "Pomodoro"
        content.body = "Hey you just successfully completed one pomodoro practice"
        content.sound = UNNotificationSound.default()
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval:1,repeats: false)
        let request = UNNotificationRequest(identifier:"poms",content:content,trigger:trigger)
        center.add(request) */
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func startTimer(_ sender: UIButton) {
        runTimer()
        startT.isHidden = true;
        resetT.isHidden = false;
        exitT.isHidden = false;
    }
    
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    @objc func timerUpdate(){
        intCounter -= 1;
        
        if intCounter == 1{
            timer.invalidate()
            
            let content = UNMutableNotificationContent()
            content.title = "Pomodoro"
            content.body = "Hey you just successfully completed one pomodoro practice"
            content.sound = UNNotificationSound.default()
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval:10,repeats: false)
            let request = UNNotificationRequest(identifier:"poms",content:content,trigger:trigger)
            center.add(request)
            print("done")
            
            
        }
        timerLabel.text! = String(format: "%0.2d:%0.2d",intCounter/60,intCounter%60)
    }
    
    // This is pause button
    @IBAction func resetTimer(_ sender: UIButton) {
        if self.resume == false{
            timer.invalidate()
            self.resume = true
            resetT.setTitle("Resume", for: .normal)
        }else {
            runTimer()
            resetT.setTitle("Pause", for: .normal)
            self.resume = false
        }
        
    }
    @IBAction func exitTimer(_ sender: Any) {
        
        timer.invalidate()
        timerLabel.text = "25:00"
        intCounter = 1800
        startT.isHidden = false
        resetT.isHidden = true
        exitT.isHidden = true
    }
    
    @IBAction func askMe(_ sender: RoundButton) {
  
        
        var msg = "The technique uses a timer to break down work into intervals, traditionally 25 minutes in length, separated by short breaks. These intervals are named pomodoros. This technique is used to improve focus."
        
        
        let alert = UIAlertController(title:"Pomodoro",message:msg,preferredStyle:UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title:"OK",style:UIAlertActionStyle.default,handler:{ (action) in
            alert.dismiss(animated: true, completion: nil)
            
        }))
        
        present(alert,animated: true,completion: nil)
        
    }
    
    
    @IBAction func timePickupbutton(_ sender: Any) {
        
        if timePick.isHidden{
            timePick.isHidden = false
            optionButton.isHidden = true
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return times.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return times[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let time = Int(times[row])
        intCounter = time!*60
        timerLabel.text! = String(format: "%0.2d:%0.2d",intCounter/60,intCounter%60)
        timePick.isHidden = true
        optionButton.isHidden = false
        
    }
    
}
