
# react-native-web-image-loader

## Getting started

`$ npm install react-native-web-image-loader --save`

### Mostly automatic installation

`$ react-native link react-native-web-image-loader`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-web-image-loader` and add `RNWebImageLoader.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNWebImageLoader.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNWebImageLoaderPackage;` to the imports at the top of the file
  - Add `new RNWebImageLoaderPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-web-image-loader'
  	project(':react-native-web-image-loader').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-web-image-loader/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-web-image-loader')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNWebImageLoader.sln` in `node_modules/react-native-web-image-loader/windows/RNWebImageLoader.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Web.Image.Loader.RNWebImageLoader;` to the usings at the top of the file
  - Add `new RNWebImageLoaderPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNWebImageLoader from 'react-native-web-image-loader';

// TODO: What to do with the module?
RNWebImageLoader;
```
  