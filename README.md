# Short-Video-like-tiktok
This is a simple app to hit the NY Times Most Popular Articles API and show a list of articles, that shows details when news on the list are tapped

## Demonstrations

Covers the following:

* Discussions
* Screenshots
* Architecture at a Glance
* Requirements
* Architecture
* ThirdParty Libraries
* How to Run
* Tests
* Author 
* Limitations
* License

## Discussions

I have used `UIKit` for user interface creation, `Combine` allows me to use features like publishers and subscribers. Used `MVVM` Architectural design pattern is for modularized, maintainable and decoupled Codeing, Bindings make UI updates easier to handle etc.
`TableView` for listing, `Diffablle Datasource` for datasource for listings. `Kingfisher` for image loading and caching

## Screenshots

|             Articles List         |         ArticleDetail          | 
|---------------------------------|------------------------------|
|![Demo](https://github.com/moazsaeed/NyTimes-Combine-MVVM/blob/main/Screenshots/listOfNews.png)|![Demo](https://github.com/moazsaeed/NyTimes-Combine-MVVM/blob/main/Screenshots/detail.png)|

## Architecture at a Glance

![Architecture at a Glance](https://github.com/moazsaeed/NyTimes-Combine-MVVM/blob/main/Screenshots/mvvm.jpeg)

## Requirements

- Xcode 13.1
- Cocoapods 1.11.2
- Swift 5.0
- Minimum iOS version 15.0

## Architecture
1. MVVM (Model View ViewModel)

## ThirdParty Libraries
- Kingfisher (for image loading and caching)
- KRProgressHUD (for progress hud while processing in the app)

## How to Run
- clone the repository or download the zip file
- open terminal and go to project directory
- run command `pod install` to install the dependencies
- Run the project

## Tests
not added yet

## Author

moazsaeed, moazsaeed@live.com

## Limitations
API has limited number of videos. you can only scrolll through available number of videos.

## License

This is available under the MIT license. See the LICENSE file for more info.


