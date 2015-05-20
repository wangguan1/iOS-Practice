//
//  UIApplication+EventRecord.m
//  EventLogTest
//
//  Created by MacPro on 5/20/15.
//
//

#import "UIApplication+EventRecord.h"

@implementation UIApplication (EventRecord)



// not override
- (BOOL)er_sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event{
    NSString *selectorNameString = NSStringFromSelector(action);
    NSLog(@"%@", selectorNameString);
    
    return YES;
}

@end
