import SwiftUI

struct SingleLetterTextField: View {
    @Binding var text: String

    var body: some View {
        TextField("", text: $text)
            .frame(width: 40, height: 40)
            .font(.system(size: 24))
            .multilineTextAlignment(.center)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
            .onReceive(text.publisher.collect()) {
                self.text = String($0.prefix(1)).uppercased()
            }
            .keyboardType(.alphabet)
            .autocapitalization(.allCharacters)
            .disableAutocorrection(true)
            .accessibilityLabel("Campo de texto")
            .accessibilityHint("Ingresa una letra")
            .accessibilityValue(text.isEmpty ? "Vacío" : text)
    }
}
