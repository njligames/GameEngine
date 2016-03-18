//
//  Parser.h
//  NJLIDoxygenParser
//
//  Created by James Folk on 2/10/16.
//  Copyright © 2016 NJLIGames Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parser : NSObject

@property (nonatomic, strong) NSString *stubsDirectory;
@property (nonatomic, strong) NSString *ldocDirectory;
@property (nonatomic, strong) NSString *sublimeSnippetDirectory;

@property (nonatomic, strong) NSString *xmlDirectory;
@property (nonatomic, strong) NSString *swigSymbolsFile;

- (void)parseSWIGSymbols;

- (void)parseXMLFile:(NSString*)file listOnly:(BOOL)listOnly;
- (NSArray*)getList;

@end
