//
//  DesignCodeViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/18/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

class DesignCodeViewController: UIViewController {
    
    @IBOutlet weak var nav: NavigationWithTitle!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtDetails: JVFloatLabeledTextView!
    @IBOutlet weak var btnImage: UIButton!
    @IBOutlet weak var imgAddPhoto: UIImageView!
    @IBOutlet weak var nameOfFile: UILabel!
    @IBOutlet weak var imgAdd: UIImageView!
    @IBOutlet weak var nameOfImage: UILabel!
    @IBOutlet weak var imgAdd2: UIImageView!
    @IBOutlet weak var imgAddFile: UIImageView!
    
    var digital_id: Int?
    var priority: [String] = ["high", "middle", "low"]
    var fromDate: Date?
    var toDate: Date?
    var index = 0
    var selectedPirority: String?
    var fileController = UIDocumentPickerViewController(documentTypes: ["public.content"],in: .import)
    var selectedFile: Data?
    var namefile: String?
    var imageName: String?
    var selectedImage: Data?
    var mime: String?
    var navTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.nav.title = self.navTitle ?? ""
        }
    }
    
    @IBAction func pirortiy(_ sender: UIButton) {
        self.pickerAlert(title: "اختر الأولوية", message: "الأولوية", currentSelected: priority[index],array: priority, buttonTitle: sender) {
            self.selectedPirority = self.priority[self.index]
        }
    }
    
    @IBAction func fromDate(_ sender: UIButton) {
        self.datePickerAlert(buttonTitle: sender, currentDateSelected: self.fromDate) { (date) in
            self.fromDate = date
        }
    }
    
    @IBAction func toDate(_ sender: UIButton) {
        self.datePickerAlert(buttonTitle: sender, currentDateSelected: self.toDate) { (date) in
            self.toDate = date
        }
    }
    @IBAction func addPhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    @IBAction func addFile(_ sender: Any) {
        fileController.delegate = self
        present(fileController, animated: true,completion: nil)
    }
    
    @IBAction func confirmOrder(_ sender: Any) {
        let request = CreateDigitalRequest()
        request.digital_id = "\(digital_id ?? 0)"
        request.name = txtFullName.text
        request.email = txtEmail.text
        request.mobile = txtMobile.text
        request.priority = selectedPirority
        request.details = txtDetails.text
        request.date_from = fromDate?.toString(customFormat: "yyyy-MM-dd")
        request.date_to = toDate?.toString(customFormat: "yyyy-MM-dd")
        request.selectedFile = selectedFile
        request.namefile = namefile
        request.nameImage = imageName
        request.selectedImage = selectedImage
        request.mimeType = mime
        if (fromDate ?? Date()) < Date(){
            self.showAlertError(message: "تاريخ البداية خاطئ")
        }else if (fromDate ?? Date()) >= (toDate ?? Date()){
            self.showAlertError(message: "تاريخ النهاية خاطئ")
        }else{
            RequestBuilder.requestWithSuccessfullRespnose(request: request, success: { (obj) in
                self.showAlertPopUp(title: "تنبيه", message: obj.message ?? "", action1: {
                    if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CompleteOrderViewController"){
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }) {
                    
                }
            })
        }
        
    }
}
extension DesignCodeViewController{
    func setupView(){
       
    }
}
extension DesignCodeViewController: UIDocumentPickerDelegate , UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    @available(iOS 11.0, *)
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if let filename = urls.first?.lastPathComponent {
            mime = filename.mimeType()
            if let url = urls.first{
                let data = try? Data.init(contentsOf: url)
                self.selectedFile = data
                self.namefile = filename
                nameOfFile.text = namefile
                imgAddFile.image = "ic_file".image_
                imgAdd.isHidden = true
            }
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imgAddPhoto.image = image
        
        guard let fileUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL else { return }
        print(fileUrl.lastPathComponent)
        let filename = fileUrl.lastPathComponent
        mime = filename.mimeType()
        let data = try? Data.init(contentsOf: fileUrl)
        self.selectedImage = data
        self.imageName = filename
        nameOfImage.text = imageName
        imgAdd2.isHidden = true
        self.dismiss(animated: true, completion: nil)
    }
}
