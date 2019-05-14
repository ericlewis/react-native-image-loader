# react-native-image-loader-plugin

This is a proof-of-concept approach for improving React Native's Image component - currently **iOS only**.
Once added, react-native will start using SDWebImage's decoders, caches, and network capabilities!

This can lead to better performances in Image-heavy react-native apps, you can check some early benchmarks over on this [twitter thread](https://twitter.com/ericlewis/status/1127447416674947072).

## Getting started

`yarn add react-native-image-loader-plugin`
or
`npm install react-native-image-loader-plugin --save`

### Mostly automatic installation

`react-native link react-native-image-loader-plugin`

### Manual installation

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-image-loader-plugin` and add `RNWebImageLoader.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNWebImageLoader.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<
