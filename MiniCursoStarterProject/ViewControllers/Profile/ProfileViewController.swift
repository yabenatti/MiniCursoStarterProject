//
//  ProfileViewController.swift
//  MiniCursoParte1
//
//  Created by Yasmin Benatti on 2017-09-04.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIControl!
    
    // MARK: - Variables
    var activeTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Profile"
        
        self.emailTextField.delegate = self
        self.nameTextField.delegate = self
        self.setUpTextFieldLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /*Adding notification to move textfield with keyboard */
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        /*Removing notification when leaving the screen */
        
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UI Methods
    
    func setUpTextFieldLayout() {
        self.emailTextField.setLeftPaddingPoints(8)
        self.nameTextField.setLeftPaddingPoints(8)
        
        self.emailTextField.layer.borderWidth = 1
        self.nameTextField.layer.borderWidth = 1
        
        self.emailTextField.layer.borderColor = Colors.lighterGray.cgColor
        self.nameTextField.layer.borderColor = Colors.lighterGray.cgColor
        
        self.setEditionDisabled()
    }
    
    func setEditionEnabled() {
        self.emailTextField.isUserInteractionEnabled = true
        self.nameTextField.isUserInteractionEnabled = true
        
        self.emailTextField.backgroundColor = UIColor.white
        self.nameTextField.backgroundColor = UIColor.white
        
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveProfile)), animated: true)
    }
    
    func setEditionDisabled() {
        self.emailTextField.isUserInteractionEnabled = false
        self.nameTextField.isUserInteractionEnabled = false
        
        self.emailTextField.backgroundColor = Colors.whiteSmoke
        self.nameTextField.backgroundColor = Colors.whiteSmoke
        
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editProfile)), animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Keyboard
    @IBAction func hideKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func editProfile(_ sender: Any) {
        self.setEditionEnabled()
    }
    
    @IBAction func saveProfile(_ sender: Any) {
        self.setEditionDisabled()
    }

}

extension ProfileViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = Colors.lightSalmonPink.cgColor
//        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = Colors.lighterGray.cgColor
//        self.activeTextField = nil
    }
    
}

/*
extension ProfileViewController {
    func keyboardWasShown(notification: NSNotification) {
        //Need to calculate keyboard exact size due to Apple suggestions
        self.scrollView.isScrollEnabled = true
        let info : NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height, 0.0)
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if let activeFieldPresent = self.activeTextField {
            if (!aRect.contains(activeFieldPresent.frame.origin)) {
                self.scrollView.scrollRectToVisible(activeFieldPresent.frame, animated: true)
            }
        }
        
        
    }
    
    
    func keyboardWillBeHidden(notification: NSNotification) {
        //Once keyboard disappears, restore original positions
        let info : NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, -keyboardSize!.height, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
        self.scrollView.isScrollEnabled = false
        
    }
}
 */
