//
//  EmojiRatingView.swift
//  Day-54
//
//  Created by Ojas Gupta on 14/1/2023.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            return Text("😭")
        case 2:
            return Text("😔")
        case 3:
            return Text("😊")
        case 4:
            return Text("😃")
        default:
            return Text("🤩")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
