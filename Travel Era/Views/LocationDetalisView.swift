//
//  LocationDetalisView.swift
//  Travel Era
//
//  Created by Eranga prabath on 2023-08-18.
//

import SwiftUI
import MapKit

struct LocationDetalisView: View {
    @EnvironmentObject private var viewModel:locationViewModel
    let location:Location
    var body: some View {
        ScrollView{
            VStack{
           imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y:10)
                VStack(alignment: .leading,spacing: 16){
                    textView
                    Divider()
                    descriptionSection
                    Divider()
                    locationMap
                }.frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton,alignment: .topTrailing)
    }
}
extension LocationDetalisView{
    private var imageSection:some View{
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    private var textView:some View{
    
            VStack(alignment: .leading,spacing: 8){
                Text(location.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(location.cityName)
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
        }
    private var descriptionSection:some View{
    
            VStack(alignment: .leading,spacing: 8){
                Text(location.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                if let url = URL(string: location.link){
                    Link("Read more on web",destination: url)
                        .foregroundColor(Color.blue)
                        .font(.headline)
                }
                
            }
        }
    private var locationMap:some View{
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
            annotationItems: [location]){ location in
            MapAnnotation(coordinate: location.coordinates) {
                locationMapAnnotationView()
                    .shadow(radius: 10)
                
            }
        }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
        
    }
    
    private var backButton:some View{
        Button{
            withAnimation(.easeOut){
                viewModel.sheetLocation = nil
            }
        }label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(Color.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
            
    
}

struct LocationDetalisView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetalisView(location: LocationsDataService.locations.first!)
            .environmentObject(locationViewModel())
    }
}
