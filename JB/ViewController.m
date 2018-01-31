//
//  ViewController.m
//  JB
//
//  Created by Benjamin on 31.01.18.
//  Copyright © 2018 Benjamin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self isJailbroken]) {
        self.view.backgroundColor = [UIColor redColor];
    } else {
        self.view.backgroundColor = [UIColor greenColor];
    }
}

-(BOOL) isJailbroken
{
#if TARGET_IPHONE_SIMULATOR
    return NO;
#else
    FILE *f = fopen("/bin/bash", "r");
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL exist =  [fileManager fileExistsAtPath:@"/private/var/lib/apt"];
    if (errno == ENOENT && !exist) {
        fclose(f);
        return NO;
    } else {
        fclose(f);
        return YES;
        
    }
#endif
}

- (IBAction)exitApp:(id)sender {
    exit(0);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
