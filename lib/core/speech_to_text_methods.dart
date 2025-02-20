import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextMethods {
  SpeechToTextMethods._internal();

  static final instance = SpeechToTextMethods._internal();

  void initSpeech(SpeechToText _speechToText, bool isSpeechEnabled) async {
    isSpeechEnabled = await _speechToText.initialize();
  }

  void startListening(SpeechToText _speechToText, bool isSpeechEnabled,
      Function(String) onTextChanged) async {
    if (isSpeechEnabled) {
      await _speechToText.listen(
          onResult: (result) => onSpeechResult(result, onTextChanged));
    } else {
      print("Speech recognition not initialized yet.");
    }
  }

  void stopListening(SpeechToText _speechToText) async {
    await _speechToText.stop();
  }

  void onSpeechResult(
      SpeechRecognitionResult result, Function(String) onTextChanged) {
    String lastWords = result.recognizedWords;
    onTextChanged(
        lastWords); // Pass the recognized words back to the UI or caller
  }
}
