//
//  Receipt_Radar_Progress_View.swift
//  receiptor
//
//  Created by Omkar Malpure on 23/09/24.
//

import SwiftUI

struct Receipt_Radar_Progress_View: View {
    @State private var autoAdvanceInterval : TimeInterval = 1
    @State private var progressValues: [CGFloat] = [0, 0, 0]
    @State private var currentPage = 0
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue
                
                
                VStack{
                    HStack{
                        ForEach(0..<3 , id : \.self){ page in
                            ProgressBars(percent: progressValues[page])
                        }
                    }
                    Text("Hello, World!")
                }
                
            }.onAppear(perform: startTimer)
        }
    }
    
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if progressValues[currentPage] < 1 {
                progressValues[currentPage] += 0.1 / (autoAdvanceInterval)
            } else {
                if currentPage < 2 {
                    goToNextPage()
                } else {
                    timer.invalidate()
                }
            }
        }
    }
    
    
    func goToNextPage() {
        if currentPage < 2 {
            progressValues[currentPage] = 1 // Set current progress bar to 100%
            currentPage += 1
        }
    }
    
    func goToPreviousPage() {
        if currentPage > 0 {
            progressValues[currentPage] = 0 // Set current progress bar to 0%
            currentPage -= 1
            progressValues[currentPage] = 0 // Reset the previous progress bar
        }
    }
    
    

}

struct ProgressBars : View {
     var percent : CGFloat  = 0
     @State private var autoAdvanceInterval : TimeInterval = 1
    
    
    var body : some View {
        let multiplier = percent / 100
        ZStack(alignment:.leading){
            
                Rectangle()
                    .fill(Color.white.opacity(0.3))
                    .frame(height: 3)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: multiplier * percent,height:3)
                    .animation(.linear(duration: autoAdvanceInterval), value: percent)
          
        }
        .frame(height: 3)
        .padding(.horizontal)
        .padding(.top, 50)
    }
    
}


#Preview {
    Receipt_Radar_Progress_View()
}
