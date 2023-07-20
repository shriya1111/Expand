//
//  SettingRowView.swift
//  Look
//
//  Created by Shriya Edukulla on 7/19/23.
//

import SwiftUI

struct SettingRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.medium)
                .font(.subheadline)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
        
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
    }
}
