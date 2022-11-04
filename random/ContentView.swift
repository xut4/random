//
//  ContentView.swift
//  random
//
//  Created by User14 on 2022/11/4.
//

import SwiftUI

struct ContentView: View {
    @State private var result : Int = 5
    @State private var plus : Int = 0
    @State private var ans = ["yes","no"]
    let circle:[CGSize]=[CGSize(width: 0, height: -55),CGSize(width: 35, height: 55),CGSize(width: -55, height: -12),CGSize(width: -35, height: 55),CGSize(width: 55, height: -12)]
    @State private var showAlert = false
    var body: some View {
        ZStack {
            Image("Image")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0,
                       maxWidth: .infinity, minHeight: 0,
                       maxHeight: .infinity)
                .ignoresSafeArea()
            ForEach(0..<result, id: \.self){i in
                Circle()
                    .frame(width: 70.0).foregroundColor(.orange)      .offset(circle[i])
            }
            Circle()
                .frame(width: 100.0).foregroundColor(.yellow)
            Text(String(result))
                .font(.largeTitle)
            VStack{
                Text("解答花花")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color.pink)
                Text("心中默想要問的問題（yes/no）\nex:我要不要嫁給他\n將產生一朵隨機花瓣數量的花")
                    .fontWeight(.black)
                Spacer()
                Text("要以哪個選擇開始")
                    .font(.headline)
                HStack{
                    Button(action:{
                        result=Int.random(in: 1...5)
                        self.showAlert = true
                        plus=1
                    }){
                        Text("是")
                            .font(.system(size: 28, design: .monospaced))
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(10.0)
                    }
                    Spacer()
                    Button(action:{
                        result=Int.random(in: 1...5)
                        self.showAlert = true
                        plus=0
                    }){
                        Text("否")
                            .font(.system(size: 28, design: .monospaced))
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(10.0)
                    }
                }.padding().alert(isPresented: $showAlert) { () -> Alert in
                    return Alert(title: Text("解答："), message:Text(ans[(result+plus)%2]),dismissButton: .destructive(Text("OK"), action: {
                        print("OK")
                    }))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
