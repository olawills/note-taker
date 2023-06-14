# Welcome To Flutter Note Taker

<p> A Flutter Notes Taker</p>
<p> Uses Firebase to store and authenticate users</p>

## App Build can be found at
- apk/app-realease.apk

## Features

- Sign in with email/password
- Create account with name, password, email
- Proper validation of users to enhance encryption
- Add/Create Notes
- delete/update Posts(Upcoming)

## Folder Structure

```
lib
├───app (route handler)
│   
services (All the models, firebase and user authentication methods)
│   ├───firebase
│   ├───model
│   
|
│         
└───Ui (all the codes that is visible to the users)
    ├───shared (contains constants and resusable widgets)
    ├───views (Contains all the screen of the app)
|
|─── main.dart
|
└─── my_app.dart
```

### Local Setup

- Create a firebase account if not already
- Create a new project in your firebase
- Go to settings and add android to your project
- You have the option of using flutter fire cli or u can download the google-services.json after configuring your platform configurations
- Create a firebase account if not already
- Go to settings and add android to your project.
- Remember the package name you give to your application.
- Download the ```google-services.json``` and place it in ```android/app``` folder.
- Now, in ```android/app/build.gradle``` file change line 37 to your own applicationId which you gave in step 5 above.
- In firebase, enable the ```Firestore Database```, and ```Authentication``` services. In the Authentication service make sure to add Email-Password and Google Auth providers for sign-in and sign-up features to work.
- Run ```flutter pub get```.
- Run ```flutter run``` to run the app in your android emulator/device.


