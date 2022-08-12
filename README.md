# SpeakyFox Multiplatform App

///////////////////////
Clean Architecture

Layer-structure:

Presentation(V -> VM -)--> Domain(Services, Models-)--> Data(Repositories(remote, local)) 

plus 

App(global configs & functionalities, helpers, ...) 


State-Management-lib: stacked

////////////////////////

To generate JSON-Mappings type in CMD:

flutter pub run build_runner build --delete-conflicting-outputs
