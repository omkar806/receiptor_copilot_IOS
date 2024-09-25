//
//  Receipt_Radar_Onboarding_View.swift
//  receiptor_copilot
//
//  Created by Omkar Malpure on 14/08/24.
//

import SwiftUI



struct Receipt_Radar_Onboarding_View: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var currentPage = 0
    let totalPages = 3
    @State private var progressValues: [CGFloat] = [0, 0, 0]
    @State private var animatedProgressValues: [CGFloat] = [0, 0, 0]
    @State private var fillTimer: Timer?
    let autoAdvanceInterval: TimeInterval = 0.1
    let fillIncrement: CGFloat = 0.02
    
    let pages: [OnboardingPage] = [
        OnboardingPage(title: "Turn your receipts\ninto rewards", imageName: "cart"),
        OnboardingPage(title: "Link Your Email Account", imageName: "gift"),
        OnboardingPage(title: "You'll automatically earn points for receipts", imageName: "star")
    ]
    @State private var navigateToContentView = false
    @State private var navigateToHowItWorksView = false


    
    var body: some View {
        
        NavigationView{
        GeometryReader { geometry in
           
                backgroundGradient
                
                
                    progressBars // Three separate progress bars
            VStack {
                    TabView(selection: $currentPage) {
                        ForEach(0..<totalPages, id: \.self) { index in
                            pageView(for: pages[index])
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .animation(.easeInOut, value: currentPage)
                    
                    Spacer()
                    
                    
                }
                
                
                HStack {
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            goToPreviousPage()
                        }
                    
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            goToNextPage()
                        }
                        
                }
                
                if currentPage == totalPages - 1 {

                
                    NavigationLink(destination: HowItWorksView()) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .padding(.bottom, 40)
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
 
                }
                
          
            
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: startFillingCurrentBar)
    }
    }
    
    var backgroundGradient: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.indigo]),
                       startPoint: .top,
                       endPoint: .bottom)
    }
    
    // Three separate progress bars
    var progressBars: some View {
        HStack(spacing: 4) {
            ForEach(0..<totalPages, id: \.self) { page in
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.white.opacity(0.3))
                            .frame(height: 3)
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: geometry.size.width * progressValues[page], height: 3)
                    }
                }
            }
        }
        .frame(height: 2)
        .padding(.horizontal)
        .padding(.top, 50)
    }
    
    // View for each page
    func pageView(for page: OnboardingPage) -> some View {
        VStack {
            headerView
            Spacer()
            animationView(imageName: page.imageName)
            Spacer()
            Text(page.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Spacer()
        }
    }
    
    var headerView: some View {
        HStack {
            Image(systemName: "cart")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
            Text("Receipt Radar")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
            }
        }
        .padding(.top, 50)
        .padding(.horizontal)
    }
    

    
  

    
    func animationView(imageName: String) -> some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .foregroundColor(.white)
    }

    
    func startFillingCurrentBar() {
        stopTimer()
        fillTimer = Timer.scheduledTimer(withTimeInterval: autoAdvanceInterval, repeats: true) { _ in
            if progressValues[currentPage] < 1 {
                progressValues[currentPage] += fillIncrement
                if progressValues[currentPage] >= 1 {
                    progressValues[currentPage] = 1
                    stopTimer()
                    if currentPage < totalPages - 1 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            goToNextPage()
                        }
                    }
                }
            }
        }
    }
    
    func stopTimer() {
        fillTimer?.invalidate()
        fillTimer = nil
    }
    
    func goToNextPage() {
        if currentPage < totalPages - 1 {
            progressValues[currentPage] = 1 // Instantly fill current bar
            currentPage += 1
            progressValues[currentPage] = 0 // Instantly reset next bar
            startFillingCurrentBar() // Start filling the new current bar
        }
    }
    
    func goToPreviousPage() {
        if currentPage > 0 {
            stopTimer() // Stop the current timer
            progressValues[currentPage] = 0 // Instantly reset current bar
            currentPage -= 1
            progressValues[currentPage] = 0 // Reset the previous bar to 0
            startFillingCurrentBar() // Start filling the bar of the previous page
        }
    }
    
    
}





struct OnboardingPage {
    let title: String
    let imageName: String
}



#Preview {
    Receipt_Radar_Onboarding_View()
}
