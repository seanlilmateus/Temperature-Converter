//
//  main.m
//  TemperatureConverter
//
//  Created by Mateus Armando on 13.05.11.
//  Copyright 2011 Sean Coorp. INC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
