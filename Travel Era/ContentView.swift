//
//  ContentView.swift
//  Travel Era
//
//  Created by Eranga prabath on 2023-08-17.
//

import SwiftUI
import MapKit
enum mapDetails{
    static let currebtLocation =  CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054)
    static let defualtSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}
struct ContentView: View {
    @State var region:MKCoordinateRegion = MKCoordinateRegion(center:mapDetails.currebtLocation, span:mapDetails.defualtSpan )
    var body: some View {
       Map(coordinateRegion: $region)
            .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
