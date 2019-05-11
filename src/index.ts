import { NativeModules } from 'react-native';

interface Interface {
  readonly clearCache: (expiredOnly?: boolean) => Promise<null>;
  readonly getDiskSize: () => Promise<number>;
}

const { RNWebImageLoader } = NativeModules;
const loader: Interface = RNWebImageLoader;

export default loader;
