//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Egor Naberezhnov on 07.05.2024.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode
    @State private var draftProfile = Profile.default
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            HStack {
                
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear(perform: {
                        modelData.profile = draftProfile
                    })
                
            }
        })
        .padding()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
