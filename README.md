# Cryptocurrencies Tracker Application
- #### Version 0.6.4
This application offers a catalog of existing cryptocurrencies.
It brings together all the details, links and information for each digital assets. 

## About
- Android 11.0 (R) API 30
- Develop on Pixel 2 API 30
- Flutter Clean Architecture / MVVM
- Maintainer : Quentin Moreau

## Notice
Run ```flutter pub run build_runner build --delete-conflicting-outputs``` to generate `objectbox.g.dart` for ObjectBoxDatabase.

## Unit Test
Unit test carried out with Mockito package.
Need to use `build runner` to create mock.test files. 
NullSafety compatible.

## Resources
Used CoinGecko API v3 : https://www.coingecko.com/en/api/documentation

## Issues Finded
For shaders compilation on android 11, it's better to make the emulator compatible with ```OpenGL ES 1.1/2.0```.
Once the emulator is started, go to the side panel and select : "```... > Settings > Advanced > Compatibility OpenGL ES 1.1 / 2.0```"
This fixes problem of shared compilation error when starting Android with : Flutter Version >= 2.