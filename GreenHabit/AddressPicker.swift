//
//  AddressPicker.swift
//  GreenHabit
//
//  Created by Anya Li on 10/22/23.
//

import SwiftUI
import MapKit

struct AddressPicker: View {

    @ObservedObject var locationSearchService: LocationSearchService
    @Environment(\.dismiss) var dismiss
    var body: some View {
//        NavigationView {
            VStack {
                HStack{
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle")
                    }
                    .padding([.top, .trailing])
                }
                SearchBar(text: $locationSearchService.searchQuery)
                List{
                    
                    ForEach(locationSearchService.completions) { completion in
                        
                        Button(action:{
                                dismiss()
                            }){
                            VStack(alignment: .leading) {
                                Text(completion.title)
//                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                Text(completion.subtitle)
//                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                        
            //            }
                    
        }
    }

//    private func didTapOnCompletion(_ completion: MKLocalSearchCompletion) {
//        InfoBoard()
//    }
}

#Preview {
    AddressPicker(locationSearchService: LocationSearchService())
}
