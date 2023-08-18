//
//  locationListView.swift
//  Travel Era
//
//  Created by Eranga prabath on 2023-08-18.
//

import SwiftUI

struct locationListView: View {
    @EnvironmentObject private var viewModel:locationViewModel
    var body: some View {
        ZStack{
            List{
                
                ForEach(viewModel.locations) { location in
                    
                    Button{
                        viewModel.showNextLocation(location: location)
                    }label: {
                        lisRowView(location: location)
                    }.padding(.vertical,4)
                        .listRowBackground(Color.clear)

              
                                            
                }
            }.frame(maxHeight: .greatestFiniteMagnitude)
            .listStyle(PlainListStyle())
        }
    }
}

extension locationListView{
    
    private func lisRowView(location:Location) -> some View{
        HStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45,height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment:.leading){
                Text (location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
                
            }.frame(maxWidth:.infinity,alignment:.leading)
              
            
        }
    }
}

struct locationListView_Previews: PreviewProvider {
    static var previews: some View {
       locationView()
            .environmentObject(locationViewModel())
    }
}
