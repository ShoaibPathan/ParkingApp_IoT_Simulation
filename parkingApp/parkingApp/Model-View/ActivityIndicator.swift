//
//  ActivityIndicator.swift
//  parkingApp
//
//  Created by Nils Brand on 02.12.19.
//  Copyright © 2019 hypeTech. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: View {
     @State var degrees = 0.0
    
    
    var body: some View {
          Circle()
              .trim(from: 0.0, to: 0.6)
            .stroke( lineWidth: 5.0)
            .stroke(Color.yellow, lineWidth: 5.0)
              //.stroke(darkBlue, lineWidth: 5.0)???????????????????
              .frame(width: 80, height: 80)
              .rotationEffect(Angle(degrees: degrees))
              .onAppear(perform: {self.start()})
      }

   func start() {
            _ = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                withAnimation {
                    self.degrees += 10.0
                }
                if self.degrees == 360.0 {
                    self.degrees = 0.0
                }
            }
        }
    }



struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}

//https://www.blckbirds.com/post/progress-bars-in-swiftui
