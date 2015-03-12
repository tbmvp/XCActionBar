//
//  PGActionIndex.h
//  PGXcodeActionBrowser
//
//  Created by Pedro Gomes on 11/03/2015.
//  Copyright (c) 2015 Pedro Gomes. All rights reserved.
//

#import <Foundation/Foundation.h>

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
@protocol PGActionBrowserProvider;
@protocol PGActionIndex <NSObject>

- (void)registerProvider:(id<PGActionBrowserProvider>)provider;

- (void)updateWithCompletionHandler:(PGGeneralCompletionHandler)completionHandler;

- (NSArray *)lookup:(NSString *)str;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
@interface PGActionIndex : NSObject <PGActionIndex>

@end
