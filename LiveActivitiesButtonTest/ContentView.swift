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

			}
				HStack(spacing: 30) {
					Button {
						timer = .now
						guard let timer else { return }
						let update =  ButtonActivityTestAttributes.ContentState(timer: timer)
						let attributes = ButtonActivityTestAttributes()
						activity = try? Activity<ButtonActivityTestAttributes>.request(attributes: attributes, contentState: update)


					} label: {
						Label("Start session", systemImage: "play.fill")
					}

					Button(action: {
						timer = nil
					}, label: {
						Label("Stop", systemImage: "pause.fill")
					})
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
