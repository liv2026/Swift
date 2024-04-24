//
//  ContentView.swift
//  CatsOrDogs
//
//  Created by Lopes, Olivia on 4/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model: AnimalModel
    
    var body: some View {
        VStack {
           
            Image(uiImage: UIImage(data: model.animal.imageData ?? Data()) ?? UIImage())
                .resizable()
                .scaledToFit()
                .clipped()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                //apple class known as ui image)
                
                HStack{
                    Text("What is it?")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding(.leading, 10)
                    Spacer()
                    Button(action: {self.model.getAnimal()},
                           label: {Text("Next").bold()
                    })
                }
            List(model.animal.results){
                result in
                HStack{
                    Text(result.imageLabel)
                    Spacer()
                    //Text(String(format:%2f))
                }
            }
                
                
    
        }
        .onAppear(perform: {
            model.getAnimal()
        })
        .opacity(model.animal.imageData == nil ? 0:1)
        .padding()
    }
}

#Preview {
    ContentView(model: AnimalModel())
}
