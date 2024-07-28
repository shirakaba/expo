// https://github.com/react-native-community/cli/blob/main/docs/projects.md

/** @type import("@react-native-community/cli-types").Config */
module.exports = {
  // Upon `pod install`, React Native Community CLI searches for the first
  // Podfile it can find from the project root, so even if you run `pod install`
  // inside the "macos" directory, it'll install the pods for "ios". Specifying
  // sourceDir explicitly for each platform avoids that.
  // https://github.com/react-native-community/cli/blob/98d17296ca84769b25b54893f598476e46a539d7/packages/cli-platform-apple/src/config/findPodfilePath.ts#L60
  project: {
    ios: {
      sourceDir: "./ios",
    },
    macos: {
      sourceDir: "./macos",
    },
  },
  // Disable Expo CLI's autolinking on bare react-native projects.
  // https://github.com/expo/expo/blob/1c817c999f8291d67cbb189f892401aa41597d20/packages/expo/react-native.config.js#L46
  dependency: {
    // https://github.com/react-native-community/cli/blob/main/docs/platforms.md#platform-interface
    platforms: {
      ios: {},
      android: {},
      macos: null,
      windows: null,
    },
  },
};
