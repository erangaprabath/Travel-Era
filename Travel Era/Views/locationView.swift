//
//  locationView.swift
//  Travel Era
//
//  Created by Eranga prabath on 2023-08-18.
//

import SwiftUI
import MapKit

struct locationView: View {
    @EnvironmentObject private var viewModel:locationViewModel
    let maxWidthForIpad:CGFloat = 700
   
    var body: some View {
        ZStack{
          locationMap
                .ignoresSafeArea()
            
            VStack(spacing:0) {
               headerView
                    .padding()
                    .frame(maxWidth: maxWidthForIpad)
                
                Spacer()
                locationDetaisView
              
            }
        }
        .sheet(item: $viewModel.sheetLocation, onDismiss: nil){
            location in
            LocationDetalisView(location: location)
        }
    }
}


extension locationView{
    private var headerView:some View{
        VStack(){
            Button(action:
                viewModel.locationListToggle
            ){
                Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
                    .frame(height:55)
                    .frame(maxWidth:.infinity)
                    .animation(.none, value: viewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: viewModel.showListViewLocation ? 180 : 0))
                        
                    }
              
            }
            if viewModel.showListViewLocation{
                locationListView()
            }
        }.background(.thinMaterial)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.3), radius: 20,x:0,y:15)
            
    }
}
extension locationView{
    private var locationMap:some View{
        Map(coordinateRegion: $viewModel.mapRegion,
            annotationItems:viewModel.locations,
            annotationContent:{ location in
            MapAnnotation(coordinate: location.coordinates) {
                locationMapAnnotationView()
                    .scaleEffect(viewModel.mapLocation == location ? 1 : 0.5)
                    .onTapGesture {
                        withAnimation(.spring()){
                            viewModel.showNextLocation(location: location)
                        }
                    }
            }
        })
    }
    private var locationDetaisView:some View{
        ZStack{
            ForEach(viewModel.locations) { location in
                if viewModel.mapLocation == location{
                    locationPreviewView(location: location)
                        .shadow(color: .primary.opacity(0.3), radius: 20)
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxWidth: .infinity)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                }
            }
        }
    }
}


struct locationView_Previews: PreviewProvider {
    static var previews: some View {
        locationView()
            .environmentObject(locationViewModel())
    }
}
