import SwiftUI

struct WarningMessageView: View {
    var body: some View {
        HStack {
            Text("⚠️ Ranking is already empty!")
                .foregroundColor(.red)
                .font(.system(size: 16))
                .padding(.leading, 5)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .font(.system(size: 16))
        .foregroundColor(.black)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.red.opacity(0.1))
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.red.opacity(0.2), lineWidth: 2)
            }
        )

    }
}

struct WarningMessageView_Previews: PreviewProvider {
    static var previews: some View {
        WarningMessageView()
            .padding()
    }
}
