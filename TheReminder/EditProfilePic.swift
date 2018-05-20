//
//  EditProfilePic.swift
//  TheReminder
//
//  Created by Chinky Mutreja on 19/5/18.
//  Copyright © 2018 Chinky Mutreja. All rights reserved.
//

import UIKit

class EditProfilePic: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var editpic: UIImageView!
   
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var quoteText: UITextView!
    
    let name = UserDefaults.standard.object(forKey: "userName")  as? String
    let quote = UserDefaults.standard.object(forKey: "userQuote") as? String
    let quoteStatus = UserDefaults.standard.object(forKey: "QuoteON") as? Bool

    
    
    @IBOutlet weak var quoteSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageData = UserDefaults.standard.object(forKey: "userProfilePic") as! NSData
        editpic.image = UIImage(data: imageData as Data)
        
        // Do any additional setup after loading the view.
       editpic.layer.cornerRadius = editpic.frame.size.width/2;
        editpic.clipsToBounds = true;
        editpic.layer.borderColor = UIColor.clear.cgColor;
        editpic.layer.borderWidth = 2;
        
        
        
        nameText.text = name
        quoteText.text = quote
        quoteSwitch.isOn = quoteStatus!
        
        
    }

    @IBAction func toggleQuote(_ sender: UISwitch) {
        if sender.isOn{
            if quoteText == nil{
                quoteSwitch.isOn = false
                return
            }
            
            UserDefaults.standard.set(sender.isOn,forKey:"QuoteON")
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

   
    @IBAction func chooseProfilePicture(_ sender: Any) {
        let myPicker = UIImagePickerController()
        myPicker.delegate = self
        myPicker.sourceType = .photoLibrary
        
        present(myPicker,animated: true,completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        //editpic.image = image
        let imageData:NSData = UIImageJPEGRepresentation(image!, 1.0)! as NSData
        UserDefaults.standard.set(imageData,forKey: "userProfilePic")
        let data = UserDefaults.standard.object(forKey: "userProfilePic") as! NSData
        editpic.image = UIImage(data: data as Data)
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
