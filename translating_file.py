import speech_recognition as sr
from gtts import gTTS
import playsound 
import translators as ts
from deep_translator import GoogleTranslator
from pydub import AudioSegment
import os

# English - Hindi
# German - Russian
# English - Spanish

r = sr.Recognizer()


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


# convert text to speech - English
def robot_talk(lang, text):
    # create audio
    file_name = 'audio_data.mp3'
    # convert text to speech
    tts = gTTS(text = text, lang=lang)
    # save file
    tts.save(file_name)
    # play file
    playsound.playsound(r"C:\\Users\\mosim\\Downloads\\hackunt\\audio_data.mp3")
    # remove file
    os.remove(file_name)


# translator english-spanish
def translator_en_es(text):
    translated_text = GoogleTranslator(source='en', target='es').translate(text)
    robot_talk('es', translated_text)


def translator_en_pt(text):
    translated_text = GoogleTranslator(source='en', target='pt').translate(text)
    robot_talk('pt', translated_text)


def translator_pt_en(text):
    translated_text = GoogleTranslator(source='pt', target='en').translate(text)
    robot_talk('en', translated_text)


def translator_en_te(text):
    translated_text = GoogleTranslator(source='en', target='te').translate(text)
    robot_talk('te', translated_text)


def translator_te_en(text):
    translated_text = GoogleTranslator(source='te', target='en').translate(text)
    robot_talk('en', translated_text)



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
                        translator_en_es(text_to_translate)
                    else:
                        break
            
            if 'portuguese to english' in source_target_lang:
                robot_talk('en', 'Got it, you need a translator from Portuguese to English. What can I translate for you?')
                while True:
                    text_to_translate = robot_listen('pt')
                    print(text_to_translate)

                    if text_to_translate != 'change translator':
                        translator_pt_en(text_to_translate)
                    else:
                        break

            if 'english to portuguese' in source_target_lang:
                robot_talk('en', 'Got it, you need a translator from English to Portuguese. What can I translate for you?')
                while True:
                    text_to_translate = robot_listen('en')
                    print(text_to_translate)

                    if text_to_translate != 'change translator':
                        translator_en_pt(text_to_translate)
                    else:
                        break


            # english - telugu
            elif 'english to telugu' in source_target_lang:
                robot_talk('en', 'Got it, you need a translator from English to Telugu. What can I translate for you?')
                while True:
                    text_to_translate = robot_listen('en')
                    print(text_to_translate)

                    if text_to_translate != 'change translator':
                        translator_en_te(text_to_translate)
                    else:
                        break

            
            # telugu - english
            elif 'telugu to english' in source_target_lang:
                robot_talk('en', 'Got it, you need a translator from Telugu to English. What can I translate for you?')
                while True:
                    text_to_translate = robot_listen('te')
                    print(text_to_translate)

                    if text_to_translate != 'change translator':
                        translator_te_en(text_to_translate)
                    else:
                        break

            elif 'turn off translator':
                robot_talk('en', 'It was a pleasure to do the translation job.')
                break

            else:
                robot_talk('en', 'Sorry, I did not get what you said')

    else:
        robot_talk('en', 'Sorry, I can not support you with that.')


def robot_run():
    langs_list = GoogleTranslator().get_supported_languages()
    print(langs_list)
    robot_talk('en', 'Hi there. Nice to meet you. I am Glorp, your personal translator. What is your name?')
    listen_name = robot_listen('en')
    robot_talk('en', 'Hi ' + listen_name + ' how can I help you?')
    listen_assistant = robot_listen('en')
    print(listen_assistant)
    robot_reply(listen_assistant)


print('run')
robot_run()
