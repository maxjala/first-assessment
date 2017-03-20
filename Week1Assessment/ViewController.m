//
//  ViewController.m
//  Week1Assessment
//
//  Created by Max Jala on 20/03/2017.
//  Copyright © 2017 Max Jala. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField1;

@property (weak, nonatomic) IBOutlet UITextField *textField2;

@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@property (assign, nonatomic) NSInteger inputValue1;

@property (assign, nonatomic) NSInteger inputValue2;

@property (assign, nonatomic) NSInteger calculatedValue;

@property (strong,nonatomic) IBOutletCollection(UIButton) NSArray *operatorBttons;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.formatter = [[NSNumberFormatter alloc]init];
    //self.formatter.numberStyle = NSNumberFormatterDecimalStyle;
    //self.formatter.maximumFractionDigits = 10;
    
    for(UIButton *button in self.operatorBttons) {
        
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
}

-(void)buttonPressed:(UIButton *)sender {
    
    NSString *buttonText = sender.titleLabel.text;
    
    self.inputValue1 = [self.textField1.text integerValue];
    self.inputValue2 = [self.textField2.text integerValue];
    
    
    if ([buttonText isEqualToString:@"+"]) {
        
        self.calculatedValue = self.inputValue1 + self.inputValue2;
        
    } else if ([buttonText isEqualToString:@"-"]) {
        
        self.calculatedValue = self.inputValue1 - self.inputValue2;
        
    } else if ([buttonText isEqualToString:@"x"]) {
        
        //account for 0 inputs
        if([self.textField1.text isEqualToString: @"0"]) {
            self.answerLabel.text = @"Error";
            return;
        } else if([self.textField2.text isEqualToString: @"0"]) {
            self.answerLabel.text = @"Error";
            return;
        }
        
        self.calculatedValue = self.inputValue1 * self.inputValue2;
        
    } else if ([buttonText isEqualToString:@"÷"]) {
        
        //account for 0 inputs
        if([self.textField1.text isEqualToString: @"0"]) {
            self.answerLabel.text = @"Error";
            return;
        } else if([self.textField2.text isEqualToString: @"0"]) {
            self.answerLabel.text = @"Error";
            return;
        }
        
        self.calculatedValue = self.inputValue1 / self.inputValue2;
    }
    
    
    //update answer label
    self.answerLabel.text = [NSString stringWithFormat:@"%i", self.calculatedValue];
    
    if (self.calculatedValue == 0){
        return;
    }
    
    if (self.calculatedValue == 999) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"GENIUS!" message:@"Well Done" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *google = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *alert) {
            
            //Perform Segue by calling mainstory board segue identifier "restartSegue"
            [self performSegueWithIdentifier:@"segue" sender:nil];
            
            
        }];
        
        [alert addAction:google]; // Add action to alert controller.
        
        [self presentViewController:alert animated:YES completion:NULL];

        
    } else if ([self.answerLabel.text integerValue] % 9 == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"GENIUS!" message:@"Well Done" preferredStyle:UIAlertControllerStyleAlert];
        
        //2. Create action
        UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:NULL];
        
        [alert addAction:dismissAction];
        
        [self presentViewController:alert animated:YES completion:NULL];
                                                   
                                                   
    }
}





@end
