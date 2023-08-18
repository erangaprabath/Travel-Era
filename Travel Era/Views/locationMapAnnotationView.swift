//
//  locationMapAnnottionView.swift
//  Travel Era
//
//  Created by Eranga prabath on 2023-08-18.
//

import SwiftUI

struct locationMapAnnotationView: View {
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack{
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30)
                .font(.headline)
                .foregroundColor(Color.white)
                .padding(6)
                .background(accentColor)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10,height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-10 )
                .padding(.bottom,40 )
        }
    }
}

struct locationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        locationMapAnnotationView()
    }
}
