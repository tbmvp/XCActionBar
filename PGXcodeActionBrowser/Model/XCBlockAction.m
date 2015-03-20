//
//  PGBlockAction.m
//  XCActionBar
//
//  Created by Pedro Gomes on 10/03/2015.
//  Copyright (c) 2015 Pedro Gomes. All rights reserved.
//

#import "XCBlockAction.h"

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
@interface XCBlockAction ()

@property (nonatomic,   copy) XCBlockActionHandler action;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
@implementation XCBlockAction

#pragma mark - Dealloc and Initialization

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
- (instancetype)initWithTitle:(NSString *)title
                       action:(XCBlockActionHandler)action
{
    NSParameterAssert(title);
    NSParameterAssert(action);
    
    if((self = [self initWithTitle:title subtitle:@"" action:action])) {
        
    }
    return self;
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
- (instancetype)initWithTitle:(NSString *)title
                     subtitle:(NSString *)subtitle
                       action:(XCBlockActionHandler)action
{
    if((self = [self initWithTitle:title subtitle:subtitle hint:@"" action:action])) {
        
    }
    return self;
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
- (instancetype)initWithTitle:(NSString *)title
                     subtitle:(NSString *)subtitle
                         hint:(NSString *)hint
                       action:(XCBlockActionHandler)action
{
    NSParameterAssert(title);
    NSParameterAssert(action);

    if((self = [super init])) {
        self.title    = title;
        self.subtitle = subtitle;
        self.hint     = hint;
        self.action   = action;
    }
    return self;
}

#pragma mark - Public Methods

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
- (BOOL)execute
{
    XCReturnFalseUnless(self.enabled == YES && self.action != nil);

    self.action(nil);
    
    return YES;
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
- (BOOL)executeWithContext:(id<XCIDEContext>)context
{
    XCReturnFalseUnless(self.enabled == YES && self.action != nil);

    self.action(context);

    return YES;
}

#pragma mark - Properties

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
- (BOOL)enabled
{
    // REVIEW: move this to a concrete NSMenuItemAction class or build some dynamic property checker mechanism
    // good enough for now
    BOOL supportsDynamicEnabledState = (TRCheckIsClass(self.representedObject, [NSMenuItem class]));
    if(supportsDynamicEnabledState) {
        return [(NSMenuItem *)self.representedObject isEnabled];
    }
    return self->_enabled;
}

@end
