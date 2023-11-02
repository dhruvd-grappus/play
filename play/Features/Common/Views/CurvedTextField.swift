//
//  CurvedTextField.swift
//  play
//
//  Created by Dhruv on 27/10/23.
//

import SwiftUI

struct CurvedTextField<Content: View>: View {
    @State var text = ""
    let onChanged: (String) -> Void

    let hint: Content?
    init(onChanged: @escaping (String) -> Void) {
        hint = nil
        self.onChanged = onChanged
    }

    init(@ViewBuilder hint: () -> Content?, onChanged: @escaping (String) -> Void) {
        self.hint = hint()
        self.onChanged = onChanged
    }

    var body: some View {
        HStack {
            hint

            TextField("", text: $text).onChange(of: text, perform: { value in

                onChanged(value)
            })

        }.padding(.vertical, 17).padding([.leading, .trailing], 22).background(Color("LightGrey")).cornerRadius(10)
    }
}

struct CurvedTextField_Previews: PreviewProvider {
    static func buttonTapped(withString text: String) {
        print("Button tapped with text: \(text)")
        // You can perform any actions you want here.
    }

    static var previews: some View {
        CurvedTextField(
            hint: { Text("") }, onChanged: self.buttonTapped
        )
    }
}
