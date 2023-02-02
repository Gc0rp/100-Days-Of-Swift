//
//  controlAmount.swift
//  Day-65
//
//  Created by Ojas Gupta on 2/2/2023.
//

import SwiftUI

struct ControlAmount: View {
    @Binding var showSlider: Bool
    @State var label: String
    
    @Binding var filterAmount: Double
    
    @State var process: (() -> Void)
    var body: some View {
        if(showSlider) {
            HStack {
                Text(label)
                Slider(value: $filterAmount)
                    .onChange(of: filterAmount) { _ in process() }
            }
            .padding(.vertical)
        }
    }
}
