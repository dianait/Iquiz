import SwiftUI

struct ErrorView: View {
    let message: String
    let retryAction: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 60))
                .foregroundColor(.orange)
                .accessibilityLabel("Icono de error")
                .accessibilityHidden(true)

            Text("¡Ups! Algo salió mal")
                .font(.title2)
                .fontWeight(.bold)
                .accessibilityLabel("Título de error")
                .accessibilityValue("Algo salió mal")

            Text(message)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal, 20)
                .accessibilityLabel("Mensaje de error")
                .accessibilityValue(message)

            ButtonView(text: "🔄 Intentar de nuevo") {
                retryAction()
            }
            .accessibilityIdentifier("retry_button")
            .accessibilityLabel("Intentar de nuevo")
            .accessibilityHint("Reintenta la operación que falló")
        }
        .padding(40)
        .accessibilityElement(children: .contain)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ErrorView(
                message: "No se pudieron cargar las preguntas. Verifica tu conexión a internet."
            ) {
                print("Retry action")
            }
            .previewDisplayName("☀️ Light mode")

            ErrorView(message: "Error de conexión") {
                print("Retry action")
            }
            .preferredColorScheme(.dark)
            .previewDisplayName("🌙 Dark mode")
        }
    }
}
