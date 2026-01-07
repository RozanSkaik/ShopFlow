//
//  SignUpViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/5/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

enum accountType{
    case signUp
    case editProfile
}

class SignUpViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var btnTitle: UIButton!
    @IBOutlet weak var stackSignUpWith: UIStackView!
    @IBOutlet weak var lblPass: UILabel!
    
    @IBOutlet weak var btnEdit: UIButton!
    var pagetype: accountType = .signUp
    var imageName: String?
    var selectedImage: Data?
    var mime: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    @IBAction func loginBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
    }
    
    @IBAction func editProfileImg(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    @IBAction func signUpBtn(_ sender: Any) {
        switch pagetype{
        case .signUp:
            signUp()
            break
        case .editProfile:
            editProfile()
            break
        }
        
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension SignUpViewController{
    func setupView(){
        self.navigationItem.leftItemsSupplementBackButton = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        switch pagetype{
        case .signUp:
            self.lblTitle.text = "إنشاء حساب"
            self.btnTitle.setTitle("تسجيل", for: .normal)
            self.stackSignUpWith.isHidden = false
            btnEdit.isHidden = true
        case .editProfile:
            self.lblTitle.text = "تعديل الحساب"
            self.btnTitle.setTitle("تعديل", for: .normal)
            self.stackSignUpWith.isHidden = true
            self.lblPass.text = "كلمة المرور الحالية"
            
        }
    }
    func signUp(){
        let request = LoginRequset(.signUp)
        request.name = txtName.text
        request.email = txtEmail.text
        request.mobile = txtMobile.text
        request.password = txtPassword.text
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request, showLoader: true, showErrorMessage: true) { (obj) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CodeVerfiyViewController") as! CodeVerfiyViewController
            vc.mobile = self.txtMobile.text
            self.navigationController?.pushViewController(vc, animated: true)
            UserProfile.shared.accessToken = obj.user?.accessToken ?? ""
            UserProfile.shared.profile = obj.user
        }
    }
    func editProfile(){
        let request = LoginRequset(.editProfile)
        request.name = txtName.text
        request.email = txtEmail.text
        request.mobile = txtMobile.text
        request.password = txtPassword.text
        request.nameImage = imageName
        request.selectedImage = selectedImage
        request.mimeType = mime
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request, showLoader: true, showErrorMessage: true) { (obj) in
            self.showAlertPopUp(title: "تنبيه", message: obj.message ?? "", action1: {
                self.navigationController?.popViewController(animated: true)
            }) {
                
            }
        }
    }
}
extension SignUpViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    @available(iOS 11.0, *)
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imgProfile.image = image
        
        guard let fileUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL else { return }
        print(fileUrl.lastPathComponent)
        let filename = fileUrl.lastPathComponent
        mime = filename.mimeType()
        let data = try? Data.init(contentsOf: fileUrl)
        self.selectedImage = data
        self.imageName = filename
        self.dismiss(animated: true, completion: nil)
    }
}
