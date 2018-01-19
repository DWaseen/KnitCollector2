//
//  KnitViewController.swift
//  KnitCollector
//
//  Created by Dan Waseen on 1/8/18.
//  Copyright © 2018 RevWon. All rights reserved.
//

import UIKit

class KnitViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var knitimageView: UIImageView!
    
    @IBOutlet weak var titletextField: UITextField!
    
    var knitPicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        knitPicker.delegate = self
    }


    @IBAction func photosTapped(_ sender: Any) {
        
        knitPicker.sourceType = .photoLibrary
        present(knitPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        knitimageView.image = image
        knitPicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addTapped(_ sender: Any) {
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
       let knit  = Knit(context: context)
        knit.title = titletextField.text
        knit.knitImage = UIImagePNGRepresentation(knitimageView.image!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }

    @IBAction func cameraTapped(_ sender: Any) {
    }
}
