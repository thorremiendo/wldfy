//
//  ViewController.swift
//  CoreMLDemo
//
//  Created by Sai Kambampati on 14/6/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON


class TestViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let wikipediaURl = "https://en.wikipedia.org/w/api.php"
    
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var classifier: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImage = info[.originalImage] as? UIImage {
        
            guard let convertedCIImage = CIImage(image: userPickedImage) else {
                fatalError("Cannot convert to CIImage")
            }
            
            detect(image: convertedCIImage)
        
        imageView.image = userPickedImage
            
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
     
    func detect(image: CIImage){
        guard let model = try? VNCoreMLModel(for: EndangeredAnimals().model) else {
            fatalError("cannot import model")
        }
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let classification = request.results?.first as? VNClassificationObservation else {
                fatalError("Could not classify")
            }
             
            self.navigationItem.title = classification.identifier
            self.requestInfo(animalName: classification.identifier)
        }
        let handler = VNImageRequestHandler(ciImage: image)
        do{
        try handler.perform([request])
        }
        catch {
            print(error)
        }
        
    }
    

    
    func requestInfo(animalName: String){
        
        let parameters : [String:String] = [
        "format" : "json",
        "action" : "query",
        "prop" : "extracts",
        "exintro" : "",
        "explaintext" : "",
        "titles" : animalName,
        "indexpageids" : "",
        "redirects" : "1",
        ]

        Alamofire.request(wikipediaURl, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess{
                print("got the info")
                print(response)
                
                let animalJSON: JSON = JSON(response.result.value!)
                let pageid = animalJSON["query"]["pageids"][0].stringValue
                let animalDescription = animalJSON["query"]["pages"][pageid]["extract"].stringValue
                
                self.classifier.text = animalDescription
            }
        }
        
        switch animalName {
        case "Philippine Eagle":
            self.status.text = "Critically Endangered"
        case "Walden's hornbill":
            self.status.text = "Endangered"
        case "Negros Bleeding-Heart":
            self.status.text = "Critically Endangered"
        case "Philippine Cockatoo":
            self.status.text = "Endangered"
        case "Visayan Warty Pig":
            self.status.text = "Critically Endangered"
        case "Philippine Naked-Backed Fruit Bat":
            self.status.text = "Endangered"
        case "Palawan Peacock":
            self.status.text = "Vulnerable"
        default:
            self.status.text = "N/A"
        }
        
        
    }

    @IBAction func camera(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    

}
