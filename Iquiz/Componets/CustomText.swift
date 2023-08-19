import SwiftUI

struct CustomText: View {
    var text : String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(self.text)
            .fontWeight(.light)
            .font(.title)
            .padding()
    }
}
