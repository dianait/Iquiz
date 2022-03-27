import SwiftUI

struct Counter: View {
    @Binding var timeRemaining: Int
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            CustomText(text: "⏱ TIME: \(timeRemaining)")
                    .onReceive(timer) { _ in
                        if self.timeRemaining > 0 {
                            self.timeRemaining -= 1
                    }
                }
            }

        }
    }

