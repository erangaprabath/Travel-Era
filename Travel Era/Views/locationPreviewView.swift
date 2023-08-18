//
//  locationPreviewView.swift
//  Travel Era
//
//  Created by Eranga prabath on 2023-08-18.
//

import SwiftUI

struct locationPreviewView: View {
    let location:Location
    @EnvironmentObject private var viewModel:locationViewModel
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading,spacing: 16){
                imageView
                textView
            }
            VStack(spacing:8){
                buttonViewLearnMore
                buttonViewNext
            }
        }.padding(20)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
                    .offset(y:70)
                    
            )
            .cornerRadius(10)
    }
}


extension locationPreviewView{
    private var imageView:some View{
        ZStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
                    .cornerRadius(10)
            }
        }.padding(6)
            .background(Color.white)
            .cornerRadius(10)
    }
    private var textView:some View{
        VStack(alignment: .leading,spacing: 4) {
            Text (location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
     
    }
    
    private var buttonViewLearnMore :some View{
        Button{
            viewModel.sheetLocation = location
        }label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125,height: 35)
        }.buttonStyle(.borderedProminent)
    }
    private var buttonViewNext :some View{
        Button{
            viewModel.showNextLocationInNextButtonPressed()
        }label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125,height: 35)
        }.buttonStyle(.bordered)
    }



}




struct locationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.green
            locationPreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }
    }
}
