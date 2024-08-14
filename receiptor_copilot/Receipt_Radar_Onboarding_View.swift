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
    let autoAdvanceInterval: TimeInterval = 1 // 5 seconds per page
    
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
                
                VStack(spacing: 0) {
                    progressBars // Three separate progress bars
                    
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
//
//                    VStack{
//                        Text("Get Started")
//                            .font(.headline)
//                            .foregroundColor(.blue)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.white)
//                            .cornerRadius(10)
//                            .padding(.horizontal)
//                            .padding(.bottom, 40)
//                            .frame(maxHeight: .infinity, alignment: .bottom)
//                            .background(
//                                NavigationLink(destination: HowItWorksView()) {
//                                    EmptyView()
//                                }
//                                    .hidden()
//                            )
//                    }
                
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
                    

//                    Button(action: {
//                        //                            presentationMode.wrappedValue.dismiss()
//                        navigateToHowItWorksView=true
//                        print(navigateToHowItWorksView)
//                    }) {
//                        ZStack{
//                            VStack {
//                                Spacer()
//                                Text("Get Started")
//                                    .font(.headline)
//                                    .foregroundColor(.blue)
//                                    .padding()
//                                    .frame(maxWidth: .infinity)
//                                    .background(Color.white)
//                                    .cornerRadius(10)
//                                    .padding(.horizontal)
//                                    .padding(.bottom, 40)
//                                    .background(
//                                        
//                                            NavigationLink(destination: HowItWorksView()) {
//                                                if navigateToHowItWorksView==true{
//                                                    EmptyView()
//                                                }
//                                                
//                                            }
//                                        
//                                            .hidden() // Hide the NavigationLink
//                                    )
//                            }
//                            .frame(maxHeight: .infinity, alignment: .bottom)
//                            .background(Color.clear)
//                        }
//                    }
//       
                    
                    
                    
                    
                    
                }
                
          
            
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: startTimer)
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
                            .animation(.linear(duration: autoAdvanceInterval), value: progressValues[page])
                    }
                }
            }
        }
        .frame(height: 3)
        .padding(.horizontal)
        .padding(.top, 50) // Adjust the padding to place it at the top
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
    
    var pageIndicator: some View {
        HStack(spacing: 8) {
            ForEach(0..<3) { page in
                Circle()
                    .fill(page == currentPage ? Color.white : Color.white.opacity(0.5))
                    .frame(width: 8, height: 8)
            }
        }
        .padding(.bottom, 20)
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if progressValues[currentPage] < 1 {
                progressValues[currentPage] += 0.1 / (autoAdvanceInterval)
            } else {
                if currentPage < totalPages - 1 {
                    goToNextPage()
                } else {
                    timer.invalidate()
                }
            }
        }
    }
    
    func goToNextPage() {
        if currentPage < totalPages - 1 {
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





struct OnboardingPage {
    let title: String
    let imageName: String
}


//struct Receipt_Radar_Onboarding_View: View {
//    @State private var currentPage = 0
//
//    @State private var progress: CGFloat = 0
//    let autoAdvanceInterval: TimeInterval = 2 // 5 seconds per page
//    
//    let pages: [OnboardingPage] = [
//        OnboardingPage(title: "Turn your receipts\ninto rewards", imageName: "cart"),
//        OnboardingPage(title: "Earn points for\nyour purchases", imageName: "gift"),
//        OnboardingPage(title: "Redeem rewards\nfrom top brands", imageName: "star")
//    ]
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                backgroundGradient
//                
//                VStack(spacing: 0) {
//                    segmentedProgressBar // Custom progress bar
//                    
//                    TabView(selection: $currentPage) {
//                        ForEach(0..<3, id: \.self) { index in
//                            pageView(for: pages[index])
//                                .tag(index)
//                        }
//                    }
//                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                    .animation(.easeInOut, value: currentPage)
//                    
//                    Spacer()
//                    
//
//                }
//                
//                HStack {
//                    Rectangle()
//                        .fill(Color.clear)
//                        .contentShape(Rectangle())
//                        .onTapGesture {
//                            goToPreviousPage()
//                        }
//                    
//                    Rectangle()
//                        .fill(Color.clear)
//                        .contentShape(Rectangle())
//                        .onTapGesture {
//                            goToNextPage()
//                        }
//                }
//            }
//            .edgesIgnoringSafeArea(.all)
//        }
//        .onAppear(perform: startTimer)
//    }
//    
//    var backgroundGradient: some View {
//        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
//                       startPoint: .top,
//                       endPoint: .bottom)
//    }
//    
//    // Progress bar with segmented view like WhatsApp
//    var segmentedProgressBar: some View {
//        HStack(spacing: 4) {
//            ForEach(0..<3, id: \.self) { page in
//                GeometryReader { geometry in
//                    ZStack(alignment: .leading) {
//                        Rectangle()
//                            .fill(Color.white.opacity(0.3))
//                            .frame(height: 3)
//                        
//                        Rectangle()
//                            .fill(page == currentPage ? Color.white : Color.white.opacity(0.5))
//                            .frame(width: progressWidth(for: page, in: geometry), height: 3)
//                            .animation(.linear(duration: autoAdvanceInterval), value: progress)
//                    }
//                }
//            }
//        }
//        .frame(height: 3)
//        .padding(.horizontal)
//        .padding(.top, 50) // Adjust the padding to place it at the top
//    }
//    
//    // Helper function to calculate progress width
//    func progressWidth(for page: Int, in geometry: GeometryProxy) -> CGFloat {
//        if page < currentPage {
//            return geometry.size.width
//        } else if page == currentPage {
//            return geometry.size.width * progress
//        } else {
//            return 0
//        }
//    }
//    
//    // View for each page
//    func pageView(for page: OnboardingPage) -> some View {
//        VStack {
//            headerView
//            Spacer()
//            animationView(imageName: page.imageName)
//            Spacer()
//            Text(page.title)
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .foregroundColor(.white)
//                .multilineTextAlignment(.center)
//                .padding(.horizontal)
//            Spacer()
//        }
//    }
//    
//    var headerView: some View {
//        HStack {
//            Image(systemName: "cart")
//                .resizable()
//                .frame(width: 30, height: 30)
//                .foregroundColor(.white)
//            Text("Receipt Radar")
//                .font(.title2)
//                .fontWeight(.bold)
//                .foregroundColor(.white)
//            Spacer()
//            Button(action: {
//                // Add action for closing the onboarding
//            }) {
//                Image(systemName: "xmark")
//                    .foregroundColor(.white)
//                    .font(.system(size: 20, weight: .bold))
//            }
//        }
//        .padding(.top, 50)
//        .padding(.horizontal)
//    }
//    
//    func animationView(imageName: String) -> some View {
//        Image(systemName: imageName)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 100, height: 100)
//            .foregroundColor(.white)
//    }
//    
//    var pageIndicator: some View {
//        HStack(spacing: 8) {
//            ForEach(0..<3) { page in
//                Circle()
//                    .fill(page == currentPage ? Color.white : Color.white.opacity(0.5))
//                    .frame(width: 8, height: 8)
//            }
//        }
//        .padding(.bottom, 20)
//    }
//    
//    func startTimer() {
//        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//            if progress < 1 {
//                progress += 0.1 / (autoAdvanceInterval )
//            } else {
//                progress = 0
//                if currentPage < 3 - 1 {
//                    currentPage += 1
//                } else {
//                    timer.invalidate()
//                }
//            }
//        }
//    }
//    
//    func goToNextPage() {
//        if currentPage < 3 - 1 {
//            currentPage += 1
//            progress = 0
//        }
//    }
//    
//    func goToPreviousPage() {
//        if currentPage > 0 {
//            currentPage -= 1
//            progress = 0
//        }
//    }
//}
//
//struct OnboardingPage {
//    let title: String
//    let imageName: String
//}

//struct Receipt_Radar_Onboarding_View: View {
//    @State private var currentPage = 0
//    let totalPages = 3
//    @State private var progress: CGFloat = 0
//    let autoAdvanceInterval: TimeInterval = 5 // 5 seconds per page
//    
//    let pages: [OnboardingPage] = [
//        OnboardingPage(title: "Turn your receipts\ninto rewards", imageName: "cart"),
//        OnboardingPage(title: "Earn points for\nyour purchases", imageName: "gift"),
//        OnboardingPage(title: "Redeem rewards\nfrom top brands", imageName: "star")
//    ]
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                backgroundGradient
//                
//                VStack(spacing: 0) {
//                    progressBar
//                    
//                    TabView(selection: $currentPage) {
//                        ForEach(0..<totalPages, id: \.self) { index in
//                            pageView(for: pages[index])
//                                .tag(index)
//                        }
//                    }
//                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                    .animation(.easeInOut, value: currentPage)
//                    
//                    pageIndicator
//                }
//                
//                HStack {
//                    Rectangle()
//                        .fill(Color.clear)
//                        .contentShape(Rectangle())
//                        .onTapGesture {
//                            goToPreviousPage()
//                        }
//                    
//                    Rectangle()
//                        .fill(Color.clear)
//                        .contentShape(Rectangle())
//                        .onTapGesture {
//                            goToNextPage()
//                        }
//                }
//            }
//            .edgesIgnoringSafeArea(.all)
//        }
//        .onAppear(perform: startTimer)
//    }
//    
//    var backgroundGradient: some View {
//        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
//                       startPoint: .top,
//                       endPoint: .bottom)
//    }
//    
//    var progressBar: some View {
//        GeometryReader { geometry in
//            ZStack(alignment: .leading) {
//                Rectangle()
//                    .fill(Color.white.opacity(0.3))
//                    .frame(height: 3)
//                
//                Rectangle()
//                    .fill(Color.white)
//                    .frame(width: geometry.size.width * progress, height: 3)
//                    .animation(.linear, value: progress)
//            }
//        }
//        .frame(height: 3)
//    }
//    
//    func pageView(for page: OnboardingPage) -> some View {
//        VStack {
//            headerView
//            Spacer()
//            animationView(imageName: page.imageName)
//            Spacer()
//            Text(page.title)
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .foregroundColor(.white)
//                .multilineTextAlignment(.center)
//                .padding(.horizontal)
//            Spacer()
//        }
//    }
//    
//    var headerView: some View {
//        HStack {
//            Image(systemName: "cart")
//                .resizable()
//                .frame(width: 30, height: 30)
//                .foregroundColor(.white)
//            Text("Receipt Radar")
//                .font(.title2)
//                .fontWeight(.bold)
//                .foregroundColor(.white)
//            Spacer()
//            Button(action: {
//                // Add action for closing the onboarding
//            }) {
//                Image(systemName: "xmark")
//                    .foregroundColor(.white)
//                    .font(.system(size: 20, weight: .bold))
//            }
//        }
//        .padding(.top, 50)
//        .padding(.horizontal)
//    }
//    
//    func animationView(imageName: String) -> some View {
//        Image(systemName: imageName)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 100, height: 100)
//            .foregroundColor(.white)
//    }
//    
//    var pageIndicator: some View {
//        HStack(spacing: 8) {
//            ForEach(0..<totalPages) { page in
//                Circle()
//                    .fill(page == currentPage ? Color.white : Color.white.opacity(0.5))
//                    .frame(width: 8, height: 8)
//            }
//        }
//        .padding(.bottom, 20)
//    }
//    
//    func startTimer() {
//        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//            if progress < CGFloat(currentPage + 1) / CGFloat(totalPages) {
//                progress += 0.1 / (autoAdvanceInterval * 10)
//            } else if currentPage < totalPages - 1 {
//                goToNextPage()
//            } else {
//                timer.invalidate()
//            }
//        }
//    }
//    
//    func goToNextPage() {
//        if currentPage < totalPages - 1 {
//            currentPage += 1
//            progress = CGFloat(currentPage) / CGFloat(totalPages)
//        }
//    }
//    
//    func goToPreviousPage() {
//        if currentPage > 0 {
//            currentPage -= 1
//            progress = CGFloat(currentPage) / CGFloat(totalPages)
//        }
//    }
//}
//
//struct OnboardingPage {
//    let title: String
//    let imageName: String
//}



//struct Receipt_Radar_Onboarding_View: View {
//    @State private var currentPage = 0
//    let totalPages = 3
//    
//    var body: some View {
//        ZStack {
//            backgroundGradient
//            
//            VStack {
//                headerView
//                Spacer()
//                animationView
//                Spacer()
//                pageIndicator
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
//        .onTapGesture {
//            if currentPage < totalPages - 1 {
//                currentPage += 1
//            }
//        }
//    }
//    
//    var backgroundGradient: some View {
//        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
//                       startPoint: .top,
//                       endPoint: .bottom)
//    }
//    
//    var headerView: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            HStack {
//                Image(systemName: "cart")
//                    .resizable()
//                    .frame(width: 30, height: 30)
//                    .foregroundColor(.white)
//                Text("Receipt Radar")
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                Spacer()
//                Button(action: {
//                    // Add action for closing the onboarding
//                }) {
//                    Image(systemName: "xmark")
//                        .foregroundColor(.white)
//                        .font(.system(size: 20, weight: .bold))
//                }
//            }
//            .padding(.top, 50)
//            .padding(.horizontal)
//            
//            Text("Turn your receipts\ninto rewards")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .foregroundColor(.white)
//                .padding(.horizontal)
//        }
//    }
//    
//    var animationView: some View {
//        // Replace this with your actual animation view
//        Image(systemName: "cart")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 100, height: 100)
//            .foregroundColor(.white)
//    }
//    
//    var pageIndicator: some View {
//        HStack(spacing: 8) {
//            ForEach(0..<3) { page in
//                Circle()
//                    .fill(page == currentPage ? Color.white : Color.white.opacity(0.5))
//                    .frame(width: 8, height: 8)
//            }
//        }
//        .padding(.bottom, 20)
//    }
//}

#Preview {
    Receipt_Radar_Onboarding_View()
}
