//
//  PrintUtility.h
//  CrossWord
//
//  Created by Alex Smith on 14/09/2014.
//  Copyright (c) 2014 Alex Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PrintUtility : NSObject
{
    NSString* errorHeader;
}

-(id) init;
-(void) programHeader;
-(void) foundWords:(NSNumber*) wordCount;
-(void) invalidCommandLines;
-(void) invalidPattern;
-(void) invalidLetters;
-(void) invalidCommandType;
-(void) fileUnreadable: (NSString*) fileName;
-(void) fileNotFound: (NSString*) fileName;

@end
