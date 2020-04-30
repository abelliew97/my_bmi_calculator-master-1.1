*** FIREBASE QUICKSTART
1. Register project in firebase console
	- Register with application ID (Get in android/app/src/main/AndroidManifext.xml or android/app/build.gradle)
	- Choose resource region
	- Download google-services.json
	- Place json in android/app folder

2. Update gradle
	- Add in android/build.gradle
		dependencies {
			...
        		classpath 'com.google.gms:google-services:4.2.0'
    		}
	- Add in android/app/src/build.gradle
		apply plugin: 'com.google.gms.google-services'
		
		...

		defaultConfig {
			...
        		multiDexEnabled true					//Needed for firestore plugin
    		}

		dependencies {
			...
			implementation 'androidx.multidex:multidex:2.0.0'	//Needed for firestore plugin
		}

		
3. Update pubspec.yaml
	- Firebase dependencies
  		cloud_firestore: ^0.13.2+1
  		firebase_core: 0.4.4 #0.4.2
  		firebase_auth: ^0.14.0+8
  		firestore_ui: ^1.8.0
  	- Validator
  		string_validator: ^0.1.3
	- Get dependencies

*** EDITS TO ORIGINAL TUTORIAL DART FILES
1. input_page.dart
	- Add actions widget in app bar

2. result_page.dart
	- Modify bottom button to accommodate save function

*** NEW DART FILES
1. welcome.dart
2. joinUsPage.dart
3. historyPage.dart
4. loadingScreen.dart
