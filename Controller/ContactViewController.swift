//
//  ContactViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 17/08/22.
//

import UIKit

class ContactViewController: UIViewController {
    @IBOutlet weak var labelWebsite: UILabel!
    @IBOutlet weak var labelPhoneNumberContact: UILabel!
    @IBOutlet weak var labelEmailContact: UILabel!
    @IBOutlet weak var labelLocationContact: UILabel!
    @IBOutlet weak var labelFaxNumberContact: UILabel!
    @IBOutlet weak var labelFollowName: UILabel!
    @IBOutlet weak var viewFax:UIView!
    var isSelectedButton = false
    var club:Club = Club([:])
    var clubDetailsResponse:ClubDetailsResponse = ClubDetailsResponse([:])
    override func viewDidLoad() {
        super.viewDidLoad()
        if isSelectedButton == true {
            isSelectedButton = false
        }
        else {
            isSelectedButton = true
        }
        // Do any additional setup after loading the view.
    }
    func setStaticUIElementsINContact() {
        self.labelWebsite.text = clubDetailsResponse.contact.website
        self.labelPhoneNumberContact.text = clubDetailsResponse.contact.phone
        self.labelEmailContact.text = clubDetailsResponse.contact.email
        if clubDetailsResponse.contact.location.name.isEmpty {
            self.labelLocationContact.text = "--"
        }
        else {
            self.labelLocationContact.text = clubDetailsResponse.contact.location.name
        }
        if clubDetailsResponse.contact.fax.isEmpty {
            viewFax.isHidden = true
            self.labelFaxNumberContact.text = "--"
            
        }
        else {
            self.labelFaxNumberContact.text = clubDetailsResponse.contact.fax
        }
        
        self.labelFollowName.text = clubDetailsResponse.club_name
    }
    
    @IBAction func SetSocialMediaButtons(sender: AnyObject) {
        if sender.tag == 1 {
            for socialMedia in 0..<clubDetailsResponse.contact.socialMedia.count {
                let titleUrl = clubDetailsResponse.contact.socialMedia[socialMedia].title
                if titleUrl == "Facebook" {
                    let setUrl = clubDetailsResponse.contact.socialMedia[socialMedia].url
                    if let url = NSURL(string: setUrl) {
                        UIApplication.shared.openURL(url as URL)
                    }
                }
            }
        }
        if sender.tag == 2 {
            for socialMedia in 0..<clubDetailsResponse.contact.socialMedia.count {
                let titleUrl = clubDetailsResponse.contact.socialMedia[socialMedia].title
                if titleUrl == "Twitter" {
                    let setUrl = clubDetailsResponse.contact.socialMedia[socialMedia].url
                    if let url = NSURL(string: setUrl) {
                        UIApplication.shared.openURL(url as URL)
                    }
                }
            }
        }
        if sender.tag == 3 {
            for socialMedia in 0..<clubDetailsResponse.contact.socialMedia.count {
                let titleUrl = clubDetailsResponse.contact.socialMedia[socialMedia].title
                if titleUrl == "Instagram" {
                    let setUrl = clubDetailsResponse.contact.socialMedia[socialMedia].url
                    if let url = NSURL(string: setUrl) {
                        UIApplication.shared.openURL(url as URL)
                    }
                }
            }
        }
    }
    @IBAction func contactButtons(sender: UIButton) {
        if sender.tag == 1 {
            let website = clubDetailsResponse.contact.website
            if let url = NSURL(string: website) {
                UIApplication.shared.openURL(url as URL)
            }
        }
        if sender.tag == 2 {
            if isSelectedButton == true {
                self.performSegue(withIdentifier: "ContactCallViewController", sender: self)
            }
            else {
//                navigationController?.popViewController(animated: true)
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let ViewController = storyBoard.instantiateViewController(withIdentifier: "ContactViewController") as! ContactViewController
                self.present(ViewController, animated:true, completion:nil)
            }
        }
        
    }
    
    
   
}


