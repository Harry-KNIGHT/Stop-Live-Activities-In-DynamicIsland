//
//  ContentView.swift
//  LiveActivitiesButtonTest
//
//  Created by Elliot Knight on 16/11/2022.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
	@State private var timer: Date?

	@State private var activity: Activity<ButtonActivityTestAttributes>?
	var body: some View {
		VStack {
			if let dateTimer = timer {
				Text(dateTimer, style: .timer)
					.font(.title)
			}

			HStack(spacing: 30) {
				Button {
					if timer != nil {
						guard let timer else { return }
						let state = ButtonActivityTestAttributes.ContentState(timer: timer)
						Task {
							await activity?.end(using: state, dismissalPolicy: .immediate)
						}
						self.timer = nil

					} else {
						timer = .now
						guard let timer else { return }
						let update =  ButtonActivityTestAttributes.ContentState(timer: timer)
						let attributes = ButtonActivityTestAttributes()
						activity = try? Activity<ButtonActivityTestAttributes>.request(attributes: attributes, contentState: update)
					}

				} label: {
					Label(timer == nil ? "Start" : "Stop", systemImage: timer == nil ? "play.fill" : "pause.fill")
						.font(.title)
				}
				.buttonStyle(.borderedProminent)
				.buttonBorderShape(.capsule)
			}
		}
		.padding()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
