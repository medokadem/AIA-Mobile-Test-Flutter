# 🤖 AIA - Voice Chat Assistant — Flutter App

A powerful, modern AI voice assistant app built with **Flutter**, featuring a clean chat interface, speech input/output, and integration with **ChatGPT**. Designed to deliver a rich voice-driven user experience with smart UI/UX enhancements.

---

## ✨ Features

✅ **Chat UI**  
A polished and user-friendly chat interface using `flutter_chat_ui`.

✅ **Send Messages as Text**  
Users can type and send messages just like any messaging app.

✅ **Text-to-Speech (TTS)**  
ChatGPT responses are read aloud using `flutter_tts`.

✅ **Speech-to-Text (STT)**  
Hold the mic button to speak — your voice is converted to text and sent automatically.

✅ **ChatGPT Integration**  
Messages are processed through OpenAI’s GPT model for natural and helpful replies.

✅ **Stop Speaking Button**  
Floating action button to stop TTS playback instantly.

✅ **API Key Protection (Security)**  
OpenAI API keys are securely removed from source code and environment-based configuration is used to prevent leaks (e.g., `.env` file).

---

## 🚀 Improvements

🔹 **Highlighted Word-by-Word Speech**  
The currently spoken word is visually highlighted in real-time as the message is read.

🔹 **Google Cloud TTS Integration (Planned)**  
Using **word time offsets** from Google Cloud TTS (paid) will allow precise synchronization for highlighted text.

🔹 **UI/UX Upgrades**  
Includes splash screen, custom input widget with animation, modern message bubbles, and clean dark/light mode friendly themes.

🔹 **Intro / About Page**  
Added an "About Me" screen with profile, email, phone, and LinkedIn — all clickable and cleanly styled.

🔹 **Stop Speak Button UX**  
Floating action button appears only when TTS is speaking, smoothly positioned with good spacing.

🔹 **Splash Screen**  
Animated splash screen with logo shown before navigating to chat interface.

🔹 **Chat Bubble Customization**  
Custom rendering of text messages using `textMessageBuilder` for highlighting + animated chat bubbles.

---

## 📊 Planned Enhancements

Here are some cool future ideas or ongoing work:

- 📈 **Analytics Page** – Track usage, voice input length, TTS stats, message counts, etc.
- 🌀 **Waveform Visualization** during speech playback
- 🌐 **Language Toggle** for multilingual voice support (TTS + STT)
- ✍️ **Typing Indicator** animation while waiting for GPT response
- 🔊 **Playback History** — let users replay GPT responses
- 🗂 **Conversation History** saved locally or via backend

---

## 🔐 Security Best Practices

- API keys are now loaded via environment variables using [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv)
- `.env` file is **excluded from Git** using `.gitignore`
- Push protection from GitHub verified no secrets are exposed in commits

---

## 🛠 Tech Stack

- **Flutter**
- `flutter_chat_ui`
- `flutter_tts`
- `speech_to_text`
- `flutter_bloc` + `dio`
- `just_audio` / audio playback (future: Google Cloud TTS)
- `url_launcher`, `flutter_dotenv`

---

## 👏 Author

Built by **Mouayad Aljamee** – Senior Mobile Developer / Mobile Team Lead  
📧 kademmedo@gmail.com  
📞 +971501485513  
🔗 [LinkedIn Profile](https://www.linkedin.com/in/mouayad-khadem-aljameeh)

---

## 📷 Screenshots

> _(You can add screenshots or screen recordings here later)_

---

## 📦 Getting Started

```bash
flutter pub get
flutter run
Make sure to create a .env file with your API keys.

