//
//  LoadingOverlay .swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 27/06/2023.
//

import Foundation
import SwiftUI

private struct LoadingOverlay<Content>: View where Content: View {
    @Environment(\.theme) var theme: Theme
    @Binding var isPresented: Bool
    @ViewBuilder let content:() -> Content
    
    var body: some View {
        content()
            .overlay(isPresented ? overlay() : nil)
    }
    
    func overlay() -> some View {
        ZStack(alignment: .center) {
            theme.colors.surfaceWhite
            AnimatedLoader()
            ZStack {
                theme.icons.base.brand
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .padding(16)
            }
        }.ignoresSafeArea()
    }
}

private struct AnimatedLoader: View {
    @Environment(\.theme) var theme: Theme
    
    let rotationTime: Double = 0.75
    let animationTime: Double = 1.9
    
    static let initialDegree: Angle = .degrees(270 )
    let rotationAmound: Angle = .degrees(240)
    
    let initialStart: Double = 0.0
    let minSegmentLength: Double = 25.0
    
    @State var spinnerStart: Double = 0
    @State var spinnerEnd: Double = 15
    @State var spinnerRotation = initialDegree
    
    private func resetSegmentLength() {
        self.spinnerStart = initialStart
        self.spinnerEnd = initialStart + minSegmentLength
    }
    
    var body: some View {
        ZStack {
            SpinnerCircle(start: spinnerStart, end: spinnerEnd)
                .stroke(theme.colors.actionPrimary, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .rotationEffect(spinnerRotation)
        }
        .frame(width: 120, height: 120)
        .background(.thinMaterial)
        .cornerRadius(.infinity)
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 15)
        
        .onAppear(){
            withAnimation(.linear(duration: animationTime*3).repeatForever(autoreverses: false)){
                spinnerRotation += .degrees(720)
            }
            
            withAnimation(.easeInOut(duration: 1.3).delay(0.6).repeatForever(autoreverses: false)) {
                spinnerEnd += 360
            }
            
            withAnimation(.easeInOut(duration: 0.6).delay(1.3).repeatForever(autoreverses: false)) {
                spinnerStart += 360
            }
        }
        
    }
    
    func animateSpinner() {
        animateSpinner(start: rotationTime) {
            self.spinnerEnd += 360
        }
        animateSpinner(start: rotationTime * 2) {
            self.spinnerStart += 360
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+animationTime) {
            resetSegmentLength()
        }
    }
    
    func animateSpinner(start: Double, completion: @escaping (() -> Void)) {
        Timer.scheduledTimer(withTimeInterval: start, repeats: false) { (mainTimer) in
            withAnimation(Animation.easeOut(duration: animationTime - start )){
                completion()
            }
        }
    }
}

private struct SpinnerCircle: Shape {
    var start: Double
    var end: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let startAngle = Angle(degrees: start.remainder(dividingBy: 360))
        let endAngle = Angle(degrees: end.remainder(dividingBy: 360))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: min(rect.width/2, rect.height/2), startAngle: startAngle , endAngle: endAngle, clockwise: false)
        return path
    }
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(start, end)}
        set {
            start = newValue.first
            end = newValue.second
        }
    }
}

extension View {
    func loadingOverlay(_ isPresented: Binding<Bool>) -> some View {
        LoadingOverlay(isPresented: isPresented) {
            self
        }
    }
}
