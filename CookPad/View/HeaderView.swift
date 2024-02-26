//
//  HeaderView.swift
//  CookPad
//
//  Created by Kamalesh Kumar on 26/02/24.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - properties
    var header: Header

    @State private var showHeadline: Bool = false

    var slideInAnimation: Animation {
      Animation.spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)
        .speed(1)
        .delay(0.25)
    }
    var body: some View {
        ZStack {
            Image(header.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            HStack {
                VStack(alignment: .leading) {
                    Text(header.headline)
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .shadow(radius: 3)
                    Text(header.subheadline)
                        .font(.footnote)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color.white)
                        .shadow(radius: 3)
                }//: VStack
                .padding(.vertical, 0)
                .padding(.horizontal, 20)
                .frame(width: 281, height: 105)
                .background(Color("ColorBlackTransparentLight"))
                .cornerRadius(12)
            }//: HStack
            .frame(width: 285, height: 105, alignment: .center)
            .offset(x: -66, y: showHeadline ? 75 : 200)
            .animation(slideInAnimation)
            .onAppear(perform: {
                self.showHeadline.toggle()
            })
        }//: ZStack
        .frame(width: 480, height: 320, alignment: .center)
    }
}

#Preview {
    HeaderView(header: headerData.randomElement()!)
}
