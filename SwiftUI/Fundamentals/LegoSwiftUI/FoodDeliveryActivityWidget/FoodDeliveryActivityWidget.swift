//
//  FoodDeliveryActivityWidget.swift
//  FoodDeliveryActivityWidget
//
//  Created by Mustafa Bekirov on 13.03.2024.
//

import WidgetKit
import SwiftUI

struct FoodDeliveryActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: FoodDeliveryAttributes.self) { context in
            // In next video we'll explore the live activity
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    VStack {
                        HStack {
                            Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 14, height: 14)
                                .foregroundStyle(.cyan)
                            Spacer()
                            Text("~ \(context.state.arrivalTime)")
                                .font(.system(size: 14))
                                .bold()
                        }
                        .padding(.horizontal, 10)
                        
                        VStack {
                            HStack {
                                Image(systemName: "figure.outdoor.cycle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 44, height: 44)
                                    .foregroundStyle(.cyan)
                                
                                VStack(spacing: 0) {
                                    HStack {
                                        Text("Your food is on delivery")
                                            .font(.system(size: 20))
                                            .bold()
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Button {
                                            
                                        } label: {
                                            HStack {
                                                Image(systemName: "phone.fill")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 14, height: 14)
                                                    .foregroundStyle(.white)
                                                Text("Call")
                                                    .font(.system(size: 10))
                                                    .foregroundStyle(.white)
                                            }
                                        }
                                        .buttonBorderShape(.capsule)
                                        Spacer()
                                    }
                                }
                            }
                            .padding(.horizontal, 30)
                        }
                    }
                }
                DynamicIslandExpandedRegion(.bottom) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("From")
                                .font(.system(size: 8))
                            Text(context.state.restaurantName)
                                .font(.system(size: 14))
                                .bold()
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("From")
                                .font(.system(size: 8))
                            Text(context.state.customerAddress)
                                .font(.system(size: 14))
                                .bold()
                        }
                    }
                    .frame(height: 20)
                    .padding(.horizontal, 10)
                }
            } compactLeading: {
                Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 14, height: 14)
                    .foregroundStyle(.cyan)
            } compactTrailing: {
                Text("En Route")
            } minimal: {
                Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 14, height: 14)
                    .foregroundStyle(.cyan)
            }
        }
    }
}
