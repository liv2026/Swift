//
//  Animal.swift
//  CatsOrDogs
//
//  Created by Lopes, Olivia on 4/8/24.
//

import Foundation

import CoreML
import Vision

struct Results: Identifiable {
    var imageLabel: String
    var confidence: Double
    var id = UUID()
}

class Animal{
    //url for the image
    var imageURL: String
    //image data
    var imageData: Data?
    //results of classifier
    var results: [Results]
    
    
    //access to mobilenetv2
    let modelFile = try! MobileNetV2(configuration: <#T##MLModelConfiguration#>)
    
    init(){
        self.imageURL = ""
        self.imageData = nil
        self.results = []
    }
    
    init?(json:[String: Any]) {
        //check for url
        guard let imageUrl = json["url"] as? String else
        {
            return nil
        }
        
        //set image information
        self.imageURL = imageUrl
        self.imageData = nil
        self.results = []
        
        
        //download the image data
        getImage()
        
        
    }
    
    func getImage() {
        //to be coded
        //1. create the url object
        let url = URL(string: imageURL)
        
        //2. check that the url is not nil
        guard url != nil else{
            print("could not return url object")
            return
        }
        
        //3. get a url session
        let session = URLSession.shared
        
        //4. create a datatask
        let dataTask = session.dataTask(with: url!)
        { (data, response, error) in
            //we do not have to parse the data; its already available
            //because we got it in the AnimalModel class using json
            
            //check if there are errors
            
            if error == nil && data != nil {
                self.imageData = data
                //classification
                self.classifyAnimal()
            }
        }
        
        //5. start a datatask
        dataTask.resume()
    }
    
    func classifyAnimal(){
        //1. getting a reference to the model (e.g., mobilevnet2)
        let model = try! VNCoreMLModel(for: modelFile.model)
        //2. getting image handler
        let handler = VNImageRequestHandler(data: imageData!)
        //3. creating a request to the model
        let request = VNCoreMLRequest(model: model) {
            (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                print("Could not classify the animal.")
                return
            }
            //update the results: classification worked and results were produced
            for classification in results{
                var identifier = classification.identifier
                
                identifier = identifier.prefix(1).capitalized +
                identifier.dropFirst()
                
                self.results.append(Results(imageLabel: identifier, confidence: Double(classification.confidence)))
            }
        }
        //4. execute the request
        do{
            try handler.perform([request])
        }
        catch{
            print("Invalid Image")
        }
    }
    
}
