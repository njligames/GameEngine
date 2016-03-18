//
//  main.m
//  NJLIDoxygenParser
//
//  Created by James Folk on 2/10/16.
//  Copyright © 2016 NJLIGames Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parser.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Parser *parser = [[Parser alloc] init];
        
        for (int i = 0; i < argc; ++i)
        {
            NSLog(@"%s\n", argv[i]);
        }
        
        //argv[1] is xmlDirectory
        //argv[2] is stubs directory
        //argv[3] is ldoc directory
        //argv[4] is snippets directory
        
        
        [parser setXmlDirectory:[NSString stringWithUTF8String:argv[1]]];
        [parser setStubsDirectory:[NSString stringWithUTF8String:argv[2]]];
        [parser setLdocDirectory:[NSString stringWithUTF8String:argv[3]]];
        [parser setSublimeSnippetDirectory:[NSString stringWithUTF8String:argv[4]]];
        [parser setSwigSymbolsFile:[NSString stringWithUTF8String:argv[5]]];
        
//        [parser setXmlDirectory:@"/Users/jamesfolk/Dropbox/GameDevelopment/NJLIGames/NJLIGameEngine/Source/jli_game_engine/version-1.0/doc/doxygen/xml/"];
//        
//        
//        [parser setStubsDirectory:@"/Users/jamesfolk/Desktop/parser/stubs/"];
//        [parser setLdocDirectory:@"/Users/jamesfolk/Desktop/parser/ldoc/"];
//        [parser setSublimeSnippetDirectory:@"/Users/jamesfolk/Desktop/parser/NJLI_snippets/"];
        
        [parser parseSWIGSymbols];
        

        
        [parser parseXMLFile:@"all" listOnly:YES];
        NSArray *array = [parser getList];
        for (NSString *file in array)
        {
            NSLog(@"%@", file);
            [parser parseXMLFile:file listOnly:NO];
        }
        NSLog(@"DONE");
        
//        [parser parseXMLFile:@"classnjli_1_1_node" listOnly:NO];
//        [parser parseXMLFile:@"classjli_1_1_material" listOnly:NO];

    }
    return 0;
}
