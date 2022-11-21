//
//  FabButton.swift
//  Created by DhiWise Pvt. Ltd.
//

import Foundation
import SwiftUI

/**
  FabButton

  # Input Variable: #

  - `action`: callback function for forwarding onClick event from control to view

  - `backgroundColor`: background color of button

  - `image`: image name from resources to display in button

  - `frame`: variable is with tuple of two values with double dataType, first for width and second is for passing height to FabButton

  # Example #
 ```

  FabButton(action: { }, backgroundColor: Color.blue, image: "", frame: (50.0, 50.0))

 ```
 */

struct FabButton: View {
    let action: () -> Void
    var backgroundColor: Color = .blue
    var image: String
    var frameInfo: (Double, Double) = (50.0, 50.0) // 0 for width & 1 for height

    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Image(image)
                .resizable()
                .colorMultiply(.white)
                .padding()
                .frame(width: CGFloat(frameInfo.0), height: CGFloat(frameInfo.1),
                       alignment: .center)
                .clipShape(Circle())
        })
        .padding()
        .background(backgroundColor)
        .frame(width: CGFloat(frameInfo.0), height: CGFloat(frameInfo.1), alignment: .center)
        .clipShape(Circle())
    }
}

struct FabButton_Previews: PreviewProvider {
    static var previews: some View {
        FabButton(action: {}, backgroundColor: Color.blue, image: "", frameInfo: (50.0, 50.0))
    }
}
