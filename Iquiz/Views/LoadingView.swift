import SwiftUI

struct LoadingView: View {

    private var dynamicColor: Color {
        Color(UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor.white.withAlphaComponent(0.7)
            default:
                return UIColor.gray.withAlphaComponent(0.7)
            }
        })
    }

    private var shadowColor: Color {
        Color(UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor.white.withAlphaComponent(0.2)
            default:
                return UIColor.black.withAlphaComponent(0.2)
            }
        })
    }

    var body: some View {
        VStack(spacing: 20) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: dynamicColor))
                .scaleEffect(1.5)

            Text("Cargando...")
                .font(.system(size: 16))
                .foregroundColor(dynamicColor)
        }
        .padding(40)
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(color: shadowColor, radius: 25)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoadingView()
                .previewDisplayName("☀️ Light mode")
                .preferredColorScheme(.light)

            LoadingView()
                .previewDisplayName("🌙 Dark mode")
                .preferredColorScheme(.dark)
        }
    }
}
