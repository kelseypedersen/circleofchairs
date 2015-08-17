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

@property(nonatomic) NSUInteger number;


- (IBAction)calculateButtonPressed:(UIButton *)sender;

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
    [self calculateSurvivors];
    [self createCircleOfChairs];
}

- (NSMutableArray *)createCircleOfChairs {
    
    int number = [self.numberInput.text intValue];
    
    // Create array from the number input
    
    NSMutableArray *chairsArray = [[NSMutableArray alloc]initWithCapacity:number];
    
    for (NSInteger i = 0; i < number; i++){
        [chairsArray addObject:[NSString stringWithFormat:@"chair: %ld", (long)i+1]];
        
        
    }

    // While the array is greater than or equal to 0
    
    while ([chairsArray count] > 1) {
        
        // Remove the first item
        
        NSLog(@"%@", chairsArray[0]);
        
        [chairsArray removeObject:chairsArray[0]];
        
        // Skip the second item - move to the end
        
        if ([chairsArray count] > 1) {
            
            NSString *secondObject = chairsArray[1];
            
            NSLog(@"%@", secondObject);
            
            [chairsArray insertObject:secondObject atIndex:[chairsArray count]];
            
//            NSLog(@"%@", chairsArray);
            
            for (NSInteger i = 0; i < [chairsArray count]; i++){
                NSLog(@"%lu", (unsigned long)[chairsArray indexOfObject:chairsArray[i]]);
            }
        }
        
//        [chairsArray removeObject:chairsArray[0]];
        

    }
    
    return chairsArray;
    
}

- (void)calculateSurvivors {
    
//    [self createCircleOfChairs];
    
    self.survivorsLabel.text = [NSString stringWithFormat: @"%@", self.numberInput.text];

    
}




@end
