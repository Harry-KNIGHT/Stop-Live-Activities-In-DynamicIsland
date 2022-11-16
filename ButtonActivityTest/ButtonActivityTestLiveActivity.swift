//
//  ButtonActivityTestLiveActivity.swift
//  ButtonActivityTest
//
//  Created by Elliot Knight on 16/11/2022.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ButtonActivityTestAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var timer: Date
    }
}

struct ButtonActivityTestLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ButtonActivityTestAttributes.self) { context in
            // Lock screen/banner UI goes here
			HStack {
				VStack {
					Text(context.state.timer, style: .timer)

				}
				Button {
					print("Call driver button tapped")
				} label: {
					Label("Call driver", systemImage: "phone")
				}
				.buttonStyle(.borderedProminent)
			}
			.padding()
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
				DynamicIslandExpandedRegion(.bottom) {
							   Button {
								   	print("Call driver button tapped")
							   } label: {
								   Label("Call driver", systemImage: "phone")
							   }
							   .foregroundColor(.indigo)
						   }
					   } compactLeading: {
						   // Create the compact leading presentation.
						   // ...
					   } compactTrailing: {
						   // Create the compact trailing presentation.
						   // ...
					   } minimal: {
						   // Create the minimal presentation.
						   // ...
					   }
					   .keylineTint(.yellow)

            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}
