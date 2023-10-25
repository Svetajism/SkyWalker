//
//  HikeBadgeView.swift
//  SkyWalker
//
//  Created by Svetlana Shardakova on 25/10/23.
//

import SwiftUI

struct HikeBadgeView: View {

    var name: String

    var body: some View {
        VStack(alignment: .center) {
//            Badge()
            Rectangle()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for (name).")
        }
    }
}

struct HikeBadgeView_Previews: PreviewProvider {

    static var previews: some View {
        HikeBadgeView(name: "Badge")
    }

}
