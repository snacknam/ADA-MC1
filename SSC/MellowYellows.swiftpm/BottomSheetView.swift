//
//  BottomSheetView.swift
//  MoonPhaseForStarPhotography
//
//  Created by 관식 on 2023/04/13.
//

import SwiftUI

struct BottomSheetView: View {
    
    @Binding var today: Date
    @Binding var showBottomSheet: Bool
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 16) {
                HStack {
                    Text("Done")
                        .foregroundColor(Color("background"))
                        .font(.system(size: 16, weight: .medium))
                    Spacer()
                    Text("Date Selection")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    Spacer()
                    Button {
                        showBottomSheet = false
                    } label: {
                        Text("Done")
                            .foregroundColor(Color("accent"))
                            .font(.system(size: 18, weight: .medium))
                    }
                }
                .padding(.horizontal, 20)
                Text("Choose a date to check the night sky.")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color("sub"))
                    .padding(.top, 8)
                DatePicker(selection: $today, displayedComponents: [.date]) {
                    Text("")
                }
                .padding(.horizontal, 16)
                .datePickerStyle(.graphical)
                .colorScheme(.dark)
                .accentColor(Color("accent"))
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
