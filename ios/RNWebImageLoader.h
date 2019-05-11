/**
 * Copyright (c) Eric Lewis.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#if __has_include("RCTImageLoader.h")
#import "RCTImageLoader.h"
#else
#import <React/RCTImageLoader.h>
#endif

@interface RNWebImageLoader : NSObject <RCTImageLoader>

@end
