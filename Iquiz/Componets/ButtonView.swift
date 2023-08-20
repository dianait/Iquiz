import SwiftUI

struct NoOpacityButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
    }
}



struct ButtonView: View {
    let text: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .font(.system(size: 16))
                .foregroundColor(.black)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.clear)
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    }
                )
        }
        .buttonStyle(NoOpacityButtonStyle())
    }
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "✅ Siguiente") { }
    }
}

