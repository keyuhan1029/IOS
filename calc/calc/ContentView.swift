import SwiftUI

struct ContentView: View {
    @State var calculator = Calculator()
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 16) {
            VStack(alignment: .trailing, spacing: 16) {
                Text(calculator.expression)
                Text(calculator.display)
                    .font(.system(size: 90))
                    .layoutPriority(1)
                    .lineLimit(2)
            }
            .truncationMode(.head)
            .minimumScaleFactor(0.6)
            .allowsTightening(true)
            .multilineTextAlignment(.trailing)
            .containerRelativeFrame(.vertical, count: 3, spacing: 16, alignment: .bottomTrailing)
            
            Grid(alignment: .bottomTrailing, horizontalSpacing: 16, verticalSpacing: 16) {
                GridRow {
                    secondaryButton("C") { calculator.undo() }
                    secondaryButton("\(Image(systemName: "plus.forwardslash.minus"))") { calculator.toggleSign() }
                    secondaryButton("\(Image(systemName: "percent"))") {
                        calculator.convertFromPercentage()
                    }
                    mainButton(mathOperator: .divide)
                }
                
                GridRow {
                    numberButton(7)
                    numberButton(8)
                    numberButton(9)
                    mainButton(mathOperator: .multiply)
                }
                
                
                GridRow {
                    numberButton(4)
                    numberButton(5)
                    numberButton(6)
                    mainButton(mathOperator: .subtract)
                }
                
                GridRow {
                    numberButton(1)
                    numberButton(2)
                    numberButton(3)
                    mainButton(mathOperator: .add)
                }
                
                
                GridRow {
                    numberButton("", shape: .capsule) {
                        calculator.pressNumber(0)
                    }
                    .gridCellUnsizedAxes(.vertical)
                    .gridCellColumns(2)
                    .overlay {
                        HStack(spacing: 16) {
                            Color.clear
                                .overlay {
                                    Text("0")
                                }
                            Color.clear
                        }
                    }
                    
                    numberButton(".") { calculator.pressDot() }
                    mainButton(mathOperator: .equal)
                }
            }
        }
        .foregroundStyle(.white)
        .font(.largeTitle)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        .background(Color.black)
    }
    
    func mainButton(mathOperator: MathOperator) -> some View {
        Button {
            calculator.pressOperator(mathOperator)
        } label: {
            Circle()
                .foregroundStyle(Color.orange)
                .overlay {
                    Image(systemName: mathOperator.systemName)
                }
        }
    }
    
    func numberButton(_ number: Int, shape: some Shape = .circle) -> some View {
        numberButton(number.description, shape: shape) { //.discription將int轉成string
            calculator.pressNumber(number)
        }
    }
    
    func numberButton(_ label: String, shape: some Shape = .circle,
                      action: @escaping () -> Void) -> some View {
        Button { 
            action() // 執行傳入的 action closure
        } label: {
            shape
                .foregroundStyle(Color(.secondaryLabel))
                .overlay {
                    Text(label)
                }
        }
    }
    
    func secondaryButton(_ label: LocalizedStringKey,
                         action: @escaping () -> Void) -> some View {
        Button {
            action() //加上() 執行action這個closure
        } label: {  // 第一個trailling closure可以省略參數名
            Circle()
                .foregroundStyle(Color(.systemGray4))
                .overlay {
                    Text(label)
                        .foregroundStyle(.black)
                }
        }
    }
    
}

#Preview {
    ContentView()
}
