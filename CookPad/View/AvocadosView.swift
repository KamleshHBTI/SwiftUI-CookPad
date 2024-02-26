//
//  AvocadosView.swift
//  CookPad
//
//  Created by Kamalesh Kumar on 26/02/24.
//

import SwiftUI

struct AvocadosView: View {
    // MARK: - Properties
    @State private var isAnimated: Bool = false

    var body: some View {
        VStack {
            Spacer()
            Image("avocado")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 240, height: 240, alignment: .center)
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
                .scaleEffect(isAnimated ? 1 : 0.9)
                .opacity(isAnimated ? 1 : 0.9)
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))

            Text("Avocados".uppercased())
                .font(.system(size: 42, weight: .bold, design: .serif))
                .foregroundStyle(Color.white)
                .padding()
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 4)
            Text("""
Creamy, green, and full of nutrients!
Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
""")
            .lineLimit(nil)
            .font(.system(.headline, design: .serif))
            .foregroundStyle(Color("ColorGreenLight"))
            .multilineTextAlignment(.center)
            .lineSpacing(8)
            .frame(maxWidth: 640, minHeight: 120)
            Spacer()
        }.background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .ignoresSafeArea()
        .onAppear(perform: {
            self.isAnimated.toggle()
        })
    }
}

#Preview {
    AvocadosView()
}
