//
//  ViewController.m
//  KeyedArchiverDemo
//
//  Created by MacPro on 5/20/15.
//
//

#import "ViewController.h"
#import "NSArray+Archive.h"
//#import "NSMutableArray+KeyedArchive.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupMutableData];
}

- (void)setupMutableData{
    NSMutableArray *sampleMutable = [[NSMutableArray alloc] initWithArray:@[@(1), @(2)]];
    
    //subclass不能调用super的category
    /*
     crash: unrecognized selector
     */
    [sampleMutable writeToPlistFile:@"FILEPATH"];
    
}

- (void)setupData{
    NSArray *sample = @[@(1), @(2)];
    [sample writeToPlistFile:@"FILEPATH"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
