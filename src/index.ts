import { NativeModules } from 'react-native';

const { RNWebImageLoader } = NativeModules;

interface Spec {
  readonly clearCache: (expiredOnly?: boolean) => Promise<void>;
  readonly getDiskSize: () => Promise<number>;
}
export default RNWebImageLoader as Spec;
