//
//  locationViewModel.swift
//  Travel Era
//
//  Created by Eranga prabath on 2023-08-18.
//

import Foundation
import MapKit
import SwiftUI



class locationViewModel:ObservableObject{
    
    @Published var locations: [Location]
    @Published var mapLocation:Location{
        didSet{
            upadateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion:MKCoordinateRegion = MKCoordinateRegion()
    // this span the defualt Span
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    @Published var showListViewLocation:Bool = false
    @Published var sheetLocation:Location? = nil
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.upadateMapRegion(location: mapLocation)
    }
    
    private func upadateMapRegion(location:Location){
        withAnimation(.spring()){
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan )
        }
        
    }
    func locationListToggle(){
        withAnimation(.spring()){
          showListViewLocation.toggle()
        }
    }
    func showNextLocation(location:Location){
        withAnimation(.spring()){
            mapLocation = location
            showListViewLocation = false
        }
    }
    
    func showNextLocationInNextButtonPressed(){
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            return
            
        }
        
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else{
            
            guard let firstLocation = locations.first else{ return }
            showNextLocation(location: firstLocation)
            return
            
        }
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
}
