//
//  TicketViewModel.swift
//  Baseball
//
//  Created by hyebin on 7/16/24.
//

import SwiftUI

class TicketViewModel: ObservableObject {
    @Published var isShowInstaAlert = false
    
    let teamIcons: [String: String] = [
        "삼성 라이온즈": "lionsIcon",
        "LG 트윈스": "twinsIcon",
        "롯데 자이언츠": "giantsIcon",
        "기아 타이거즈": "tigersIcon",
        "한화 이글스": "eaglesIcon",
        "두산 베어스": "bearsIcon"
    ]
    
    func shareInstagram(image: UIImage) {
        guard let url = URL(string: "instagram-stories://share?source_application=Baseball"),
              let imageData = image.pngData() else { return }

        if UIApplication.shared.canOpenURL(url) {
            let pasteboardItems: [String: Any] = ["com.instagram.sharedSticker.stickerImage": imageData]
            let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(300)]

            UIPasteboard.general.setItems([pasteboardItems], options: pasteboardOptions)
            UIApplication.shared.open(url)
        } else {
            print("인스타그램이 설치되어 있지 않습니다.")
            isShowInstaAlert = true
        }
    }
}
