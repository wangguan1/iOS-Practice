//
//  CustomApplication.m
//  EventLogTest
//
//  Created by MacPro on 5/20/15.
//
//

#import "CustomApplication.h"

@implementation CustomApplication



- (BOOL)sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event{
    NSString *selectorNameString = NSStringFromSelector(action);
    NSLog(@"%@", selectorNameString);
    
    return YES;
}

@end
