//
//  PrintUtility.m
//  CrossWord
//
//  Created by Alex Smith on 14/09/2014.
//  Copyright (c) 2014 Alex Smith. All rights reserved.
//

#import "PrintUtility.h"

@implementation PrintUtility

-(id) init;
{
    //Declares the commonly used error header message
    errorHeader = @"Crossword helper failed with the following error";
    return self;
}

-(void) programHeader;
{
    //Prints the program header
    NSLog(@"Crossword helper by Alex Smith");
}

-(void) foundWords:(NSNumber*) wordCount;
{
    //Prints a word count
    NSLog(@"Number of matching words found = %@", wordCount);
}

-(void) invalidCommandLines;
{
    //Prints an invalid command line error
    NSLog(@"%@",errorHeader);
    NSLog(@"Incorrect number of command line arguments");
}

-(void) invalidPattern;
{
    //Prints an invalid characters supplied error
    NSLog(@"%@",errorHeader);
    NSLog(@"Invalid character in pattern");
}

-(void) invalidLetters;
{
    //Prints an invalid characters supplied error
    NSLog(@"%@",errorHeader);
    NSLog(@"Invalid character in letters");
}

-(void) invalidCommandType;
{
    //Prints an invalid command provided error
    NSLog(@"%@",errorHeader);
    NSLog(@"Invalid find type in command line arguements");
}

-(void) fileUnreadable: (NSString*) fileName;
{
    //Prints a file unreadable error
    NSLog(@"%@",errorHeader);
    NSString* error = [NSString stringWithFormat: @"Unable to read %@", fileName];
    NSLog(@"%@", error);
}

-(void) fileNotFound: (NSString*) fileName;
{
    //Prints a file not found error
    NSLog(@"%@",errorHeader);
    NSString* error = [NSString stringWithFormat: @"File not found at %@", fileName];
    NSLog(@"%@", error);
}

@end
