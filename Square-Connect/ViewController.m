//
//  ViewController.m
//  Square-Connect
//
//  Created by Gregg Mojica on 4/21/15.
//  Copyright (c) 2015 Gregg Mojica. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking/AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    
    [manager.requestSerializer setValue:@"Bearer " forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSDictionary *parameters = @{@"quantity_delta": [NSNumber numberWithInt:-1], @"adjustment_type": @"SALE"};
    NSLog(@"Parameters are %@", parameters);
    
    [manager POST:@"https://connect.squareup.com/v1/me/inventory/00CC0141-C50C-4A7A-9FAA-368EC79DA652" parameters:@{@"quantity_delta": [NSNumber numberWithInt:-1], @"adjustment_type": @"SALE"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
