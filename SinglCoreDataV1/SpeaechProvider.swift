//
//  SpeaechProvider.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 20.01.2022.
//

import AVFoundation

class SpeaechProvider {
    
    let synthesizer = AVSpeechSynthesizer()
    let audioSession = AVAudioSession.sharedInstance()
    
    func say (phrase: String) {
        let audioSession = AVAudioSession.sharedInstance()
                    try! audioSession.setCategory(
                        AVAudioSession.Category.playback,
                        options: AVAudioSession.CategoryOptions.duckOthers
                    )
        let utterance = AVSpeechUtterance(string: phrase)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            utterance.rate = 0.5
//        speechSynthesizer(synthesizer, didFinish: utterance)
        synthesizer.speak(utterance)
    }
    
//    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
//        guard !synthesizer.isSpeaking else { return }
//
//        let audioSession = AVAudioSession.sharedInstance()
//        try? audioSession.setActive(false)
//    }
}
