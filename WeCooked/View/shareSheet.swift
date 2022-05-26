//
//  shareSheet.swift
//  WeCooked
//
//  Created by Imran razak on 23/05/2022.
//

import SwiftUI

struct shareSheet: View {
    var body: some View {
        Button(action: shareButton) {
            Image(systemName: "square.and.arrow.up")
                .frame(width: 40, height: 40)
                .background(
                    Circle()
                        .fill(Color.gray)
                )
                .foregroundColor(.white)
                .font(.headline)
                .shadow(radius: 10)
        }
    }
}

struct shareSheet_Previews: PreviewProvider {
    static var previews: some View {
        shareSheet()
    }
}
