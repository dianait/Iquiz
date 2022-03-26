import SwiftUI

struct CustomText: View {
    var text : String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(self.text)
            .fontWeight(.semibold)
            .font(.title)
            .padding()
    }
}
struct CustomText_Previews: PreviewProvider {
    static var previews: some View {
        CustomText(text: "🎉 TEXTO CUSTOM")
    }
}
