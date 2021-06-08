//
//  VolumnObserver.swift
//  invisible-stopwatch
//
//  Created by 변경민 on 2021/06/08.
//

import Foundation
import MediaPlayer

final class VolumeObserver: ObservableObject {
    @Published var volume: Float = AVAudioSession.sharedInstance().outputVolume
    // Audio session object
    private let session = AVAudioSession.sharedInstance()
    // Observer
    private var progressObserver: NSKeyValueObservation!
    func subscribe() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
            try session.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("cannot activate session")
        }
        progressObserver = session.observe(\.outputVolume) { [self] (session, _) in
            DispatchQueue.main.async {
                self.volume = session.outputVolume
            }
        }
    }
    func unsubscribe() {
        self.progressObserver.invalidate()
    }
    init() {
        subscribe()
    }
}

extension MPVolumeView {
    static func setVolume(_ volume: Float) {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = volume
        }
    }
}
