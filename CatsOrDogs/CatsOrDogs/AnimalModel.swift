//
//  AnimalModel.swift
//  CatsOrDogs
//
//  Created by Lopes, Olivia on 4/8/24.
//

import Foundation
//this file is for requesting data from the network

class AnimalModel: ObservableObject {
    @Published var animal = Animal()
    
    func getAnimal(){
        let stringUrl = Bool.random() ?catUrl: dogUrl
        
        //1. create a url object
        let url = URL(string: stringUrl)
        
        //2. check if url is not nil
        guard url != nil else
        {
            print("Couldn't create the url object")
            return
        }
        
        //3. get the url session
        let session = URLSession.shared
        
        //4. create a data task
        let dataTask = session.dataTask(with: url!)
        {(data, response, error) in
            //check for error
            if error == nil && data != nil{
                //attempt to parse the json
                do{
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]] {
                        //if we have got so far, the json has been parsed
                        let item = json.isEmpty ? [:] : json[0]
                        //json[0] gives us the first response
                        
                        if let animal = Animal(json: item){
                            DispatchQueue.main.async{
                                while animal.results.isEmpty {}
                                self.animal = animal
                            }
                        }
                    }
                } //end of try
                catch{
                    print("Could not parse the JSON")
                }
            }
                
            
        }
        
        //5. start the data task
        dataTask.resume()
    }
}
