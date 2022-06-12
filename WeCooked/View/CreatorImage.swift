//
//  CreatorImage.swift
//  WeCooked
//
//  Created by Imran razak on 10/06/2022.
//

import SwiftUI

struct CreatorImage: View {
    var body: some View {
        Button {
            print("Button was pressed!")
        } label: {
            Image("JoeWicks")
                .foregroundColor(.white)
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)

        }
        .frame(width: 50, height: 50)

    }
}

struct CreatorImage_Previews: PreviewProvider {
    static var previews: some View {
        CreatorImage()
    }
}
