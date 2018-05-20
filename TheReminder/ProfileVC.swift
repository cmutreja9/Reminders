//
//  ProfileVC.swift
//  TheReminder
//
//  Created by Chinky Mutreja on 19/5/18.
//  Copyright © 2018 Chinky Mutreja. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageData = UserDefaults.standard.object(forKey: "userProfilePic") as! NSData
        profilePic.image = UIImage(data: imageData as Data)
        profilePic.layer.cornerRadius = profilePic.frame.size.width/2;
        profilePic.clipsToBounds = true;
        profilePic.layer.borderColor = UIColor.clear.cgColor;
        profilePic.layer.borderWidth = 2;

        // Do any additional setup after loading the view.
        
        let name = UserDefaults.standard.object(forKey: "userName") as? String
        userName.text = name
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
    
    /*override func prepare(for segue:UIStoryboardSegue,sender:Any?){
        if  segue.identifier == "editProfile"{
        
            let editProfilePicture = segue.destination as! EditProfilePic;
            //var image = UIImage(named: "profile-default")
            //editProfilePicture.editpic.image = UIImage(named: "myprofile")
           
            
        }
    }*/

}
