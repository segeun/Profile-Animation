//
//  ContentView.swift
//  Profile Animation
//
//  Created by 최세근 on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isProfileExpanded = false
    
    @Namespace private var profileAnimation
    // @Namespace 쓸 때는 변수명만 선언해주면 끝
    
    var body: some View {
        
        ScrollView {
            VStack {
                if isProfileExpanded {
                    expandedProfileView
                } else {
                    collapsedProfileView
                }
                
                videoLayout
            }
        }
    }
    
    var collapsedProfileView: some View {
        HStack {
            // Profile Image
            // 각 Text에 matchedGeometryEffect를 추가해서 Text에 자연스럽게 Animation이 적용됨
            profileImage
                .matchedGeometryEffect(id: "Profile", in: profileAnimation)
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading, content: {
                Text("Vocksil")
                    .font(.title).bold()
                    .matchedGeometryEffect(id: "Name", in: profileAnimation)
                
                Text("medium.com/@segeun_ch")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .matchedGeometryEffect(id: "username", in: profileAnimation)
            })
            
            Spacer()
        }
        .padding()
    }
    
    var expandedProfileView: some View {
        VStack {
            profileImage
                .matchedGeometryEffect(id: "Profile", in: profileAnimation)
                .frame(width: 130, height: 130)
            // VStack으로 감싸야 하는 지 체크
            VStack {
                Text("Vocksil")
                    .font(.title).bold()
                    .matchedGeometryEffect(id: "Name", in: profileAnimation)
                
                Text("medium.com/@segeun_ch")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .matchedGeometryEffect(id: "username", in: profileAnimation)
                
                Text("Hello, I'm Choi Se-geun, an iOS engineer.\nI love developing apps using SwiftUI.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }
    
    var profileImage: some View {
        Image("Profile")
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .onTapGesture {
                withAnimation(.spring()) {
                    isProfileExpanded.toggle()
                    
                }
            }
    }
    
    var videoLayout: some View {
        VStack {
            ForEach(0..<5) { item in
                VStack {
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 46))
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 250)
                .background(.gray.opacity(0.3))
                .clipShape(.rect(cornerRadius: 7))
                .padding()
            }
        }
    }
    
}

#Preview {
    ContentView()
}
