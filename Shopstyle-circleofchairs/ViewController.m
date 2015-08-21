//
//  ViewController.m
//  Shopstyle-circleofchairs
//
//  Created by Kelsey Pedersen on 8/16/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *numberInput;
@property (weak, nonatomic) IBOutlet UILabel *survivorsLabel;
@property (nonatomic) NSMutableArray *inputChairsArray;
@property (nonatomic) NSMutableArray *currentChairs;


@property(nonatomic) NSUInteger number;

- (IBAction)calculateButtonPressed:(UIButton *)sender;
- (IBAction)clearButtonPressed:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateButtonPressed:(UIButton *)sender {

    NSArray *inputChairsArray = [self createCircleOfChairs];
    [self calculateSurvivors:inputChairsArray];
}

- (IBAction)clearButtonPressed:(UIButton *)sender {
    self.numberInput.text = nil;
    self.survivorsLabel.text = nil;
    self.survivorsLabel.backgroundColor = nil;
}

- (NSArray *)createCircleOfChairs {

    int number = [self.numberInput.text intValue];
    NSMutableArray *inputChairsArray = [[NSMutableArray alloc]initWithCapacity:number];
    
    for (NSInteger i = 0; i < number; i++){
        [inputChairsArray addObject:[NSString stringWithFormat:@"chair: %ld", (long)i+1]];
    }
    
    return [inputChairsArray copy];
    
}


- (NSArray *)calculateSurvivors:(NSArray *)chairsArray{
    
    // Base case: if the return array contains one object, return the return array
    // Think of chairsArray as the input value
    
    if ([chairsArray count] <= 1) return chairsArray;
    
    NSUInteger sizeOfChairsArray = ([chairsArray count] / 2);
    
    NSMutableArray *currentChairs = [[NSMutableArray alloc]initWithCapacity:sizeOfChairsArray];
    
    for (int i = 0; i < [chairsArray count]; i++){

        if (i % 2 != 0){
            [currentChairs addObject: chairsArray[i]];
        }
        
        NSLog(@"current Chairs: %@", currentChairs);
        
        if ([currentChairs count] >= 1)[self calculateSurvivors:currentChairs];
        
    }
    
    NSLog(@"%@", currentChairs);
    self.survivorsLabel.text = [NSString stringWithFormat: @"%@", currentChairs[0]];
    self.survivorsLabel.backgroundColor = [UIColor yellowColor];
    
    return currentChairs;
}



// While the array is greater than or equal to 0

//    while ([chairsArray count] > 1) {
//
//        NSMutableArray *copyArray;
//
//        // Remove the first item
//
//        NSLog(@"*******************************************************");
//
//        NSLog(@"We are removing: %@", chairsArray[0]);
//        [chairsArray removeObject:chairsArray[0]];
//        NSLog(@"Index 0 is now %@", chairsArray[0]);
//
//        // Skip the second item - move to the end
//
//        if ([chairsArray count] > 1) {
//
//            NSString *skipChair = chairsArray[0];
//
//            NSLog(@"we are skipping this chair and moving it to the back: %@", skipChair);
//
//            [chairsArray insertObject:skipChair atIndex:[chairsArray count]];
//
//            NSLog(@"%@", chairsArray);
//
//        }
//    }


@end
