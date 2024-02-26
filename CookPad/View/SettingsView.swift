//
//  SettingsView.swift
//  CookPad
//
//  Created by Kamalesh Kumar on 26/02/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationEnabled: Bool = false
    @State private var backgroundRefreshed: Bool = false

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
        VStack(alignment: .center, spacing: 5, content: {
            Image("avocado")
                .resizable()
                .scaledToFit()
                .padding(.top)
                .frame(width: 100, height: 100, alignment: .center)
                .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 4)

            Text("Avocados".uppercased())
                .font(.system(.title, design: .serif))
                .fontWeight(.bold)
                .foregroundStyle(Color("ColorGreenAdaptive"))
        })//: VStack 
        .padding()

            Form {
                // MARK: - Section 1
                Section(header: Text("General Settings")) {
                    Toggle(isOn: $notificationEnabled, label: {
                        Text("Enable Notifications")
                            .font(.system(.title3, design: .serif))
                    })

                    Toggle(isOn: $backgroundRefreshed, label: {
                        Text("Background refresh")
                            .font(.system(.title3, design: .serif))
                    })
                }

                // MARK: - Section 1
                Section(header: Text("Application")) {
                    HStack {
                        Text("Product")
                            .foregroundStyle(Color.gray)
                        Spacer()
                        Text("Avocado Recipes")
                            .font(.system(.callout, design: .serif))
                    }
                    HStack {
                        Text("Compatibility")
                            .foregroundStyle(Color.gray)
                        Spacer()
                        Text("iPhone & iPad")
                            .font(.system(.callout, design: .serif))
                    }
                    HStack {
                        Text("Developer")
                            .foregroundStyle(Color.gray)
                        Spacer()
                        Text("Kamlesh Kumar")
                            .font(.system(.callout, design: .serif))
                    }
                    HStack {
                        Text("Designer")
                            .foregroundStyle(Color.gray)
                        Spacer()
                        Text("John Doe")
                            .font(.system(.callout, design: .serif))
                    }
                    HStack {
                        Text("Website")
                            .foregroundStyle(Color.gray)
                        Spacer()
                        Text("apple.com")
                            .font(.system(.callout, design: .serif))
                    }
                    HStack {
                        Text("Version")
                            .foregroundStyle(Color.gray)
                        Spacer()
                        Text("1.0.0")
                            .font(.system(.callout, design: .serif))
                    }
                }
            }
        }
        .frame(maxWidth: 640)
    }
}

#Preview {
    SettingsView()
}
