from datetime import datetime
import speech_recognition as sr
from gtts import gTTS
import playsound
from deep_translator import GoogleTranslator
import logger_entry
import os


r = sr.Recognizer()
log = []
data = []
entry = {}


def log_translation(trans_from, trans_to, lang_from, lang_to):
    entry = {
        "transFrom": trans_from,
        "transTo": trans_to,
        "langFrom": lang_from,
        "langTo": lang_to,
        "date": datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    }
    log.append(entry)
    return entry  # Return the entry for later use


# convert speech to text
def robot_listen(lang):
    with sr.Microphone() as source:
        while True:  # loop until valid input is received
            print("Listening...")
            audio = r.listen(source)
            try:
                text = r.recognize_google(audio, language=lang)
                return text.lower()  # convert to lowercase before returning
            except sr.UnknownValueError:
                text = "I didn't catch that. Try again."
                robot_talk(lang, text)
                print(text)
            except sr.RequestError as e:
                print(f"Could not request results from Google Speech Recognition service; {e}")
                return None


# convert text to speech
def robot_talk(lang, text):
    # create audio
    file_name = 'audio_data.mp3'
    # convert text to speech
    tts = gTTS(text = text, lang=lang)
    # save file
    tts.save(file_name)
    # play file
    playsound.playsound(r"audio_data.mp3")
    # remove file
    os.remove(file_name)


# translate
def translator_from_to(source_lang, target_lang, text):
    translated_text = GoogleTranslator(source=source_lang, target=target_lang).translate(text)
    robot_talk(target_lang, translated_text)
    log_translation(text, translated_text, source_lang, target_lang)


# create a function which will give us back a reply based on the input text
def robot_reply(text):
    # translator
    if 'translate' in text:

        while True:

            robot_talk('en', 'I will choose the right translator for you. Let me know the source language and the target language.')
            source_target_lang = robot_listen('en')
            print(source_target_lang)

            # english - spanish
            if 'english to spanish' in source_target_lang:
                robot_talk('en', 'Got it, you need a translator from English to Spanish. What can I translate for you?')
                while True:
                    text_to_translate = robot_listen('en')
                    print(text_to_translate)

                    if text_to_translate != 'change translator':
                        translator_from_to('en', 'es', text_to_translate)
                    else:
                        break

            # english to portuguese
            if 'portuguese to english' in source_target_lang:
                robot_talk('en', 'Got it, you need a translator from Portuguese to English. What can I translate for you?')
                while True:
                    text_to_translate = robot_listen('pt')
                    print(text_to_translate)

                    if text_to_translate != 'change translator':
                        translator_from_to('pt', 'en', text_to_translate)
                    else:
                        break

            if 'english to portuguese' in source_target_lang:
                robot_talk('en', 'Got it, you need a translator from English to Portuguese. What can I translate for you?')
                while True:
                    text_to_translate = robot_listen('en')
                    print(text_to_translate)

                    if text_to_translate != 'change translator':
                        translator_from_to('en', 'pt', text_to_translate)
                    else:
                        break

            # english - telugu
            elif 'english to telugu' in source_target_lang:
                robot_talk('en', 'Got it, you need a translator from English to Telugu. What can I translate for you?')
                while True:
                    text_to_translate = robot_listen('en')
                    print(text_to_translate)

                    if text_to_translate != 'change translator':
                        translator_from_to('en', 'te', text_to_translate)
                    else:
                        break

            elif 'telugu to english' in source_target_lang:
                robot_talk('en', 'Got it, you need a translator from Telugu to English. What can I translate for you?')
                while True:
                    text_to_translate = robot_listen('te')
                    print(text_to_translate)

                    if text_to_translate != 'change translator':
                        translator_from_to('te', 'en', text_to_translate)
                    else:
                        break

            elif 'telugu to portuguese' in source_target_lang:
                robot_talk('en', 'Got it, you need a translator from Telugu to Portuguese. What can I translate for you?')
                while True:
                    text_to_translate = robot_listen('te')
                    print(text_to_translate)

                    if text_to_translate != 'change translator':
                        translator_from_to('te', 'pt', text_to_translate)
                    else:
                        break

            elif 'portuguese to telugu' in source_target_lang:
                robot_talk('en', 'Got it, you need a translator from Portuguese to Telugu. What can I translate for you?')
                while True:
                    text_to_translate = robot_listen('pt')
                    print(text_to_translate)

                    if text_to_translate != 'change translator':
                        translator_from_to('pt', 'te', text_to_translate)
                    else:
                        break

            # english - hindi
            elif 'english to hindi' in source_target_lang:
                robot_talk('en', 'Got it, you need a translator from English to Hindi. What can I translate for you?')
                while True:
                    text_to_translate = robot_listen('en')
                    print(text_to_translate)

                    if text_to_translate != 'change translator':
                        translator_from_to('en', 'hi', text_to_translate)
                    else:
                        break

            elif 'turn off translator':
                for entry in log:  # Pass all logged entries to the logger
                    data.append(entry)
                if entry:
                    logger_entry.data_entry(data)
                robot_talk('en', 'It was a pleasure to do the translation job.')
                break

            else:
                robot_talk('en', 'Sorry, I did not get what you said')

    else:
        robot_talk('en', 'Sorry, I can not support you with that.')


def robot_run():
    langs_list = GoogleTranslator().get_supported_languages()
    print(langs_list)
    # robot_talk('en', 'Hi there. Nice to meet you. I am Glorp, your personal translator. What is your name?')
    # listen_name = robot_listen('en')
    # robot_talk('en', 'Hi ' + listen_name + ' how can I help you?')
    listen_assistant = robot_listen('en')
    print(listen_assistant)
    robot_reply(listen_assistant)


print('run')
robot_run()
