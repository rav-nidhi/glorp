# glorp
An alien pet translator to be your next loyal companion & more!

## Inspiration
Our main source of inspiration came from our costume for this hackathon--Men in Black! The alien pet's translator capabilities are very similar to MiB's Universal Translator, which allows for crossing any language barrier.

## What it does
Similar to common house pets like cats and dogs, this alien pet will be a loyal companion. However, it will also listen to *everything* you tell it to do--including where to go! In addition, it's also a helpful friend who can translate virtually any language to or from any other language.

## How we built it
The alien itself was built using a starter kit provided by UNT Robotics and a Raspberry PI 4 provided by UNT's SPARK. We used a soldering kit, also from UNT's SPARK, to solder the wires to 4 motors attached to each of the bot's tires. The movement script was written in Python.

The translator functionality of the bot was also written in Python using an integration of Google Translators API. With the well-documented and versatile 'gtts' library, we were able to include many different languages in this script.

Lastly, the mobile application attached to the bot that stores all translation logfiles was built using Flutter and Dart. However, since our logs are stored in the cloud through a MongoDB Atlas cluster formed using Hashicorp Terraform, we also required a Python script to send GET requests for that data to keep the files on the app updated.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## What's next for glorp
- Object detection software to follow its owner and find objects around the house
- Conversational translation (more similar to the MiB universal translator)
- Other home assistant tasks (set alarms, start a list, today's news and weather, etc.)
