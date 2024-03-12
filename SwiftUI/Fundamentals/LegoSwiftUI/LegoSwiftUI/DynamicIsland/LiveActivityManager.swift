//
//  LiveActivityManager.swift
//  LegoSwiftUI
//
//  Created by Mustafa Bekirov on 13.03.2024.
//

import Foundation
import ActivityKit

class LiveActivityManager {
    
    @discardableResult
    static func startActivity(arrivalTime: String,
                              phoneNumber: String,
                              restaurantName: String,
                              customerAddress: String) throws -> String {
        var activity: Activity<FoodDeliveryAttributes>?
        let initialState = FoodDeliveryAttributes.ContentState(arrivalTime: arrivalTime,
                                                               phoneNumber: phoneNumber,
                                                               restaurantName: restaurantName,
                                                               customerAddress: customerAddress)
        do {
            activity = try Activity.request(attributes: FoodDeliveryAttributes(), contentState: initialState, pushType: nil)
            guard let id = activity?.id else { throw LiveActivityErrorType.failedToGetID }
            return id
        } catch {
            throw error
        }
    }
    
    static func listAllActivities() -> [[String:String]] {
        let sortedActivities = Activity<FoodDeliveryAttributes>.activities.sorted{ $0.id > $1.id }
        return sortedActivities.map {
            [
                "id": $0.id,
                "arrivalTime": $0.contentState.arrivalTime,
                "phoneNumber": $0.contentState.phoneNumber,
                "restaurantName": $0.contentState.restaurantName,
                "customerAddress": $0.contentState.customerAddress
            ]
        }
    }
    
    static func endAllActivities() async {
        for activity in Activity<FoodDeliveryAttributes>.activities {
            await activity.end(dismissalPolicy: .immediate)
        }
    }
    
    static func endActivity(_ id: String) async {
        await Activity<FoodDeliveryAttributes>.activities.first(where: {
            $0.id == id
        })?.end(dismissalPolicy: .immediate)
    }
    
    static func updateActivity(id: String, 
                               arrivalTime: String,
                               phoneNumber: String,
                               restaurantName: String,
                               customerAddress: String) async {
        let updateContentState = FoodDeliveryAttributes.ContentState(arrivalTime: arrivalTime, phoneNumber: phoneNumber, restaurantName: restaurantName, customerAddress: customerAddress)
        let activity = Activity<FoodDeliveryAttributes>.activities.first(where: { $0.id == id })
        await activity?.update(using: updateContentState)
    }
}

enum LiveActivityErrorType: Error {
    case failedToGetID
}
