import SwiftUI

struct ButtonView: View {
    var text: String
    var handle: ()-> Void
    
    var body: some View {
        Button(text){
               handle()
        }.padding(24)
            .font(.system(.title2, design: .monospaced))
            .frame(width: 400)
            .border(Color.blue)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "START", handle: {print("hola")})
    }
}
