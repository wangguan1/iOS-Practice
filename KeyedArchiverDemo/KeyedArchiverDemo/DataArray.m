//
//  DataArray.m
//  KeyedArchiverDemo
//
//  Created by MacPro on 5/20/15.
//
//

#import "DataArray.h"

@implementation DataArray

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder]; // should call super
    
    return self;
}

// <NSSecureCoding>
+ (BOOL)supportsSecureCoding{
    return NO;
}

@end
