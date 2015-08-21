//
//  ViewControllerTests.m
//  Shopstyle-circleofchairs
//
//  Created by Kelsey Pedersen on 8/21/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface ViewControllerTests : XCTestCase

@property(nonatomic)ViewController *vcToTest;

@end

@implementation ViewControllerTests

- (void)setUp {
    [super setUp];
    self.vcToTest = [[ViewController alloc]init];
    
}

- (void)testCalculateSurvivors {
    NSArray *input = @[@"Chair: 1", @"Chair: 2", @"Chair: 3", @"Chair: 4", @"Chair: 5", @"Chair: 6"];
    
    NSArray *survivor = [self.vcToTest calculateSurvivors:input];
    
    NSArray *expectedSurvivor = @[@"Chair: 4"];
    
    XCTAssertEqualObjects(expectedSurvivor, survivor, @"The survivor did not match the expected survivor");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}




@end
