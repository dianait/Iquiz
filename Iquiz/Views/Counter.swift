import SwiftUI

struct Counter: View {
    @State var timeRemaining: Int = 30
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            CustomText(text: "\(timeRemaining)")
                    .onReceive(timer) { _ in
                        if self.timeRemaining > 0 {
                            self.timeRemaining -= 1
                    }
                }
            }

        }
    }

struct Counter_Previews: PreviewProvider {
    static var previews: some View {
        Counter(timeRemaining: 30)
    }
}
