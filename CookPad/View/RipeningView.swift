//
//  RipeningView.swift
//  CookPad
//
//  Created by Kamalesh Kumar on 26/02/24.
//

import SwiftUI

struct RipeningView: View {

    @State private var slidingAnimation: Bool = false
    var ripening: Ripening

    var body: some View {

        VStack {
            Image(ripening.image)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(Circle())

                .background(
                    Circle().fill(Color("ColorGreenLight"))
                        .frame(width: 110, height: 110, alignment: .center)
                )
                .zIndex(1)
                .animation(Animation.easeInOut(duration: 1.5))
                .offset(y: slidingAnimation ? 55 : -55)

            // STage
            VStack(alignment: .center, spacing: 10) {
                VStack(alignment:.center, spacing: 0) {
                    Text(ripening.stage)
                        .font(.system(.largeTitle, design: .serif))
                        .fontWeight(.bold)
                    Text("STAGE")
                        .font(.system(.body, design: .serif))
                        .fontWeight(.heavy)
                }
                .foregroundStyle(Color("ColorGreenMedium"))
                .padding(.top, 65)
                .frame(width: 180)

                //Title
                Text(ripening.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundStyle(Color("ColorGreenMedium"))
                    .padding(.vertical, 12)
                    .padding(.horizontal, 0)
                    .frame(width: 220)
                    .background(
                        RoundedRectangle(cornerRadius: 12).fill(LinearGradient(colors: [Color("ColorGreenLight")], startPoint: .top, endPoint: .bottom))
                            .shadow(color: Color("ColorBlackTransparentLight"), radius: 6, x: 0, y: 6)
                    )
                Spacer()

                //Description
                Text(ripening.description)
                    .foregroundStyle(Color("ColorGreenDark"))
                    .fontWeight(.bold)
                    .lineLimit(nil)

                Spacer()

                // Ripening
                Text(ripening.ripeness.uppercased())
                    .foregroundStyle(Color.white)
                    .font(.system(.callout, design: .serif))
                    .fontWeight(.bold)
                    .shadow(radius: 3)
                    .padding(.vertical)
                    .padding(.horizontal, 0)
                    .frame(width: 185)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color("ColorGreenMedium"), Color("ColorGreenDark")]), startPoint: .top, endPoint: .bottom))
                            .shadow(color: Color("ColorBlackTransparentLight"), radius: 6, x: 0, y: 6)
                    )

                //INSTRUCTIONS
                Text(ripening.instruction)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("ColorGreenLight"))
                    .lineLimit(3)
                    .frame(width: 160)
                Spacer()
            }
            .zIndex(0)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            .frame(width: 260, height: 485, alignment: .center)
            .background(
                LinearGradient(colors: [Color("ColorGreenLight"), Color("ColorGreenMedium")], startPoint: .top, endPoint: .bottom)
                    .clipShape(.rect(cornerRadius: 20, style: .continuous))
            )
        }//: VStack
        .ignoresSafeArea()
        .onAppear(perform: {
            slidingAnimation.toggle()
        })
    }
}

#Preview {
    RipeningView(ripening: ripeningData.first!)
}
