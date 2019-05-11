import { NativeModules } from 'react-native';

const { RNWebImageLoader } = NativeModules;

interface Spec {
  readonly clearCache: (expiredOnly?: boolean) => Promise<null>;
  readonly getDiskSize: () => Promise<number>;
}
export default RNWebImageLoader as Spec;
