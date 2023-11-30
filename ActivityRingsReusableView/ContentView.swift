//
//  ContentView.swift
//  ActivityRingsReusableView
//
//  Created by Veena Shekhar on 30/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var progress: CGFloat = 0.75
    @State private var progress1: CGFloat = 0.5
    @State private var progress2: CGFloat = 0.25
    @State private var progress3: CGFloat = 0.1
    @State private var progress4: CGFloat = 0.30
    @State private var progress5: CGFloat = 0.4
    @State private var progress6: CGFloat = 0.8
    @State private var progress7: CGFloat = 0.9
    
    @State private var numberOfCircles : Int = 7
    @State private var idealWidth : CGFloat = 50
    @State private var idealWidth1 : CGFloat = 75
    @State private var idealWidth2 : CGFloat = 125
    @State private var idealWidth3 : CGFloat = 150
    @State private var zeroProg:CGFloat = 0.0
  
    var body: some View {
       // var text = "\($progress)"
        
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            ActivityRingsView(numberOfRings: $numberOfCircles, progress1: $progress, progress2: $progress1, progress3: $progress3, progress4: $progress4, progress5: $progress5, progress6: $progress6, progress7: $progress7)
            //ActivityRingView(progress: $progress1, colors: [Color.darkRed,Color.lightRed])
        
           // MyView(progress: $progress1, width: $idealWidth).fixedSize()
            /*
            ForEach(0..<10) { number in
                    Text("Row \(number)")
                    
                    
                    .bold()
                }
*/
           // if numberOfCircles == 2{
               // ActivityRingView(progress: $progress)
                    .fixedSize()
            /*
            //ActivityRingView(progress: $progress1).fixedSize()
            MyView(progress: $progress1, width: $idealWidth).fixedSize()
            MyView(progress: $progress, width: $idealWidth1).fixedSize()
            MyView(progress: $progress1, width: $idealWidth2).fixedSize()
            MyView(progress: $progress, width: $idealWidth3).fixedSize()
             */
        }
             
             }

    //Binding<Int>)
}

extension Color{
    public static var outlineRed: Color {
            return Color(decimalRed: 34, green: 0, blue: 3)
        }
        
        public static var darkRed: Color {
            return Color(decimalRed: 221, green: 31, blue: 59)
        }
        
        public static var lightRed: Color {
            return Color(decimalRed: 239, green: 54, blue: 128)
        }
        
        public init(decimalRed red: Double, green: Double, blue: Double) {
            self.init(red: red / 255, green: green / 255, blue: blue / 255)
        }

}
struct ActivityRingView: View {
    @Binding var progress: CGFloat

    var colors: [Color] = [Color.darkRed, Color.lightRed]
    //amount: Binding<Double>)
    init(progress: Binding<CGFloat>, colors: [Color]) {
        self._progress = progress
        self.colors = colors
    }
        
        var body: some View {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)

                        Circle()
                            .stroke(Color.outlineRed, lineWidth: 10)
                
                        Circle()
                            .trim(from: 0, to: progress)
                            .stroke(
                                AngularGradient(
                                    gradient: Gradient(colors: colors),
                                    center: .center,
                                    startAngle: .degrees(0),
                                    endAngle: .degrees(360)
                                ),
                                style: StrokeStyle(lineWidth: 20, lineCap: .round)
                            ).rotationEffect(.degrees(-90))
                
                Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.darkRed)
                                //.offset(y: -150)
                               .offset(y: -25)
                Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(progress > 0.95 ? Color.lightRed: Color.lightRed.opacity(0))
                               // .offset(y: -150)
                                .offset(y: -25)
                                .rotationEffect(Angle.degrees(360 * Double(progress)))
                                .shadow(color: progress > 0.96 ? Color.black.opacity(0.1): Color.clear, radius: 3, x: 4, y: 0)

                    }.frame(idealWidth: 50, idealHeight: 50, alignment: .center)
            //300
        }
}
struct ActivityRingsView:View{
    @Binding var numberOfRings:Int
    @Binding var progress1:CGFloat
    @Binding var progress2:CGFloat
    @Binding var progress3:CGFloat
    @Binding var progress4:CGFloat
    @Binding var progress5:CGFloat
    @Binding var progress6:CGFloat
    @Binding var progress7:CGFloat
    @State private var idealwidth1:CGFloat = 25.0
    @State private var idealwidth2:CGFloat = 75.0
    @State private var idealwidth3:CGFloat = 125.0
    @State private var idealwidth4:CGFloat = 175.0
    @State private var idealwidth5:CGFloat = 225.0
    @State private var idealwidth6:CGFloat = 275.0
    @State private var idealwidth7:CGFloat = 325.0
    
    public init(numberOfRings: Binding<Int>, progress1: Binding<CGFloat>, progress2: Binding<CGFloat>, progress3: Binding<CGFloat>, progress4: Binding<CGFloat>, progress5: Binding<CGFloat>, progress6: Binding<CGFloat>, progress7: Binding<CGFloat>) {
        
    
            self._numberOfRings = numberOfRings
            self._progress1 = progress1
        
        /*
        //var testValue: String {
        //toggleValue ? "true" : "false"
    //}
         init(initialValue: Bool) {
             testValue = initialValue ? "true" : "false"
         }

        */
        
        self._progress2 = progress2
        self._progress3 = progress3
        self._progress4 = progress4
        self._progress5 = progress5
        self._progress6 = progress6
        self._progress7 = progress7
        self.idealwidth1 = idealwidth1
        self.idealwidth2 = idealwidth2
        self.idealwidth3 = idealwidth3
        self.idealwidth4 = idealwidth4
        self.idealwidth5 = idealwidth5
        self.idealwidth6 = idealwidth6
        self.idealwidth7 = idealwidth7
    }
    
    
    
    //var prog:CGFloat
    var body: some View{
        switch numberOfRings{
        case 1:
            ZStack{
                ActivityRingView(progress: $progress1, colors: [Color.lightRed,Color.darkRed]).fixedSize()
            }
        case 2:
            
            ZStack{
                MyView(progress: $progress1, width: $idealwidth1).fixedSize()
                MyView(progress: $progress2, width: $idealwidth2).fixedSize()
                
            }
        case 3:
            
            ZStack{
                MyView(progress: $progress1, width: $idealwidth1).fixedSize()
                MyView(progress: $progress2, width: $idealwidth2).fixedSize()
                MyView(progress: $progress3, width: $idealwidth3).fixedSize()
            }
        case 4:
            
            ZStack{
                MyView(progress: $progress1, width: $idealwidth1).fixedSize()
                MyView(progress: $progress2, width: $idealwidth2).fixedSize()
                MyView(progress: $progress3, width: $idealwidth3).fixedSize()
                MyView(progress: $progress4, width: $idealwidth4).fixedSize()
            }
            
        case 5:
            
            ZStack{
                MyView(progress: $progress1, width: $idealwidth1).fixedSize()
                MyView(progress: $progress2, width: $idealwidth2).fixedSize()
                MyView(progress: $progress3, width: $idealwidth3).fixedSize()
                MyView(progress: $progress4, width: $idealwidth4).fixedSize()
                MyView(progress: $progress5, width: $idealwidth5).fixedSize()
            }
        case 6:
            
            ZStack{
                MyView(progress: $progress1, width: $idealwidth1).fixedSize()
                MyView(progress: $progress2, width: $idealwidth2).fixedSize()
                MyView(progress: $progress3, width: $idealwidth3).fixedSize()
                MyView(progress: $progress4, width: $idealwidth4).fixedSize()
                MyView(progress: $progress5, width: $idealwidth5).fixedSize()
                MyView(progress: $progress6, width: $idealwidth6).fixedSize()
            }
        case 7:
            
            ZStack{
                MyView(progress: $progress1, width: $idealwidth1).fixedSize()
                MyView(progress: $progress2, width: $idealwidth2).fixedSize()
                MyView(progress: $progress3, width: $idealwidth3).fixedSize()
                MyView(progress: $progress4, width: $idealwidth4).fixedSize()
                MyView(progress: $progress5, width: $idealwidth5).fixedSize()
                MyView(progress: $progress6, width: $idealwidth6).fixedSize()
                MyView(progress: $progress7, width: $idealwidth7).fixedSize()
            }
        default:
            ZStack{
                Text("There should be atleast one ring")
            }
            
            
            
        }
    }
}
struct MyView : View{
    @Binding var progress: CGFloat
    @Binding var width:CGFloat
   // var colours:[Color] = [Color.indigo, Color.white]
    var colours:[Color] = [Color.lightRed, Color.darkRed]

    var body: some View {
        //var colours:[Color] = [Color.darkRed, Color.lightRed]
        
        var offSetVal = ((width / 2) * -1)
        var numberOfRings = 2
        if numberOfRings == 2{
            ZStack{
                Circle()
                    .stroke(Color.outlineRed,lineWidth:10)
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: colours),
                            center: .center,
                            startAngle: .degrees(0),
                            endAngle: .degrees(360)
                        ),
                        style: StrokeStyle(lineWidth: 20, lineCap: .round)
                    ).rotationEffect(.degrees(-90))
                
                
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.darkRed)
                    .offset(y: offSetVal )
                
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(progress > 0.95 ? Color.lightRed: Color.lightRed.opacity(0))
                // .offset(y: -25)
                    .offset(y: offSetVal)
                    .rotationEffect(Angle.degrees(360 * Double(progress)))
                    .shadow(color: progress > 0.96 ? Color.black.opacity(0.1): Color.clear, radius: 3, x: 4, y: 0)
                
                // Text("\(offSetVal)")
                
            }.frame(idealWidth: width, idealHeight: width, alignment: .center)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
