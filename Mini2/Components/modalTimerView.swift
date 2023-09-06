//
//  modalTimerView.swift
//  Mini2
//
//  Created by Murilo Correa Pasquim on 06/09/23.
//

import SwiftUI

struct modalTimerView: View {
    
    @EnvironmentObject var manager: SceneManager
    @EnvironmentObject var repository: GameRepository
    
    var body: some View {

            TimerView()
            
    }
}

struct modalTimerView_Previews: PreviewProvider {
    static var previews: some View {
        modalTimerView()
    }
}
