//
//  WordList.h
//  CrossWord
//
//  Created by Alex Smith on 14/09/2014.
//  Copyright (c) 2014 Alex Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"
#import "PrintUtility.h"

@interface WordList : NSObject
{
    //NSMutableArray that will hold Word objects
    NSMutableArray* wordList;
    //PrintUtility that allows the object to use error messages
    PrintUtility* print;
}

-(id) init;
-(BOOL) isWordListCreatedWith: (NSString*) fileName andLength: (int) lengthOfWord;
-(void) generatePatternsWith: (NSString*) searchWord;
-(void) generateAnagramsWith: (NSString*) searchWord;
-(void) printWordList;
-(BOOL) fileExistsWith: (NSFileManager*) fm withFilePath: (NSString*) path;

@end
