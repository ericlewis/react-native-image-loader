/**
 * Copyright (c) Eric Lewis.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "RNWebImageLoader.h"

#if __has_include("RCTUtils.h")
#import "RCTUtils.h"
#else
#import <React/RCTUtils.h>
#endif

#import <SDWebImage/SDWebImageManager.h>
#import <SDWebImage/SDImageCodersManager.h>

@implementation RNWebImageLoader

RCT_EXPORT_MODULE()

- (BOOL)canLoadImageURL:(NSURL *)requestURL
{
  // Don't mess with local url's for now
  if (RCTIsLocalAssetURL(requestURL) || ![self isWebURL:requestURL]) {
    return NO;
  }
  
  return [self hasDefaultCoder:requestURL] || [self hasExtendedCoder:requestURL];
}

- (RCTImageLoaderCancellationBlock)loadImageForURL:(NSURL *)imageURL
                                              size:(CGSize __unused)size
                                             scale:(CGFloat __unused)scale
                                        resizeMode:(RCTResizeMode __unused)resizeMode
                                   progressHandler:(RCTImageLoaderProgressBlock)progressHandler
                                partialLoadHandler:(RCTImageLoaderPartialLoadBlock)partialLoadHandler
                                 completionHandler:(RCTImageLoaderCompletionBlock)completionHandler
{
  
  SDWebImageCombinedOperation *operation = [SDWebImageManager.sharedManager loadImageWithURL:imageURL options:SDWebImageProgressiveLoad context:nil progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * __unused _Nullable targetURL) {
    if (progressHandler) {
      progressHandler(receivedSize, expectedSize);
    }
  } completed:^(UIImage * _Nullable image, NSData * __unused _Nullable data, NSError * _Nullable error, SDImageCacheType __unused cacheType, BOOL finished, NSURL * __unused _Nullable imgURL) {
    if (finished) {
      completionHandler(error, image);
    } else if (partialLoadHandler) {
      partialLoadHandler(image);
    }
  }];
  
  dispatch_block_t cancellationBlock = ^{
    [operation cancel];
  };
  
  return cancellationBlock;
}

- (BOOL)hasDefaultCoder:(NSURL *)requestURL
{
  NSString *extension = [[requestURL pathExtension] uppercaseString];
  return [extension isEqualToString:@"PNG"] || [extension isEqualToString:@"JPG"] || [extension isEqualToString:@"JPEG"] || [extension isEqualToString:@"TIFF"];
}

- (BOOL)hasExtendedCoder:(NSURL *)requestURL
{
  NSString *extension = [[requestURL pathExtension] uppercaseString];
  
  __block BOOL isImageURL = NO;
  
  // Check the codec list for any extra extensions, like GIF, APNG, etc.
  // The theory here is image coders following a naming convention
  // TODO: don't loop this every time, these don't really change.
  [SDImageCodersManager.sharedManager.coders enumerateObjectsUsingBlock:^(id<SDImageCoder>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    NSString *className = NSStringFromClass(obj.class);
    if ([className isEqualToString:[NSString stringWithFormat:@"SDImage%@Coder", extension]]) {
      isImageURL = YES;
      *stop = YES;
    }
  }];
  
  return isImageURL;
}

- (BOOL)isWebURL:(NSURL *)requestURL
{
  NSString *scheme = [requestURL scheme];
  return [scheme isEqualToString:@"http"] || [scheme isEqualToString:@"https"];
}

@end
