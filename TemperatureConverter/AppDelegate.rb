#
#  AppDelegate.rb
#  TemperatureConverter
#
#  Created by Sean Mateus  on 13.05.11.
#  Copyright 2011 Sean Mateus.All rights reserved.
#

class AppDelegate < NSObject
	attr_accessor :window, :rankine_form_cell, :sharedUserDefaultsController
    
	def initialize
	    NSValueTransformer.setValueTransformer CentigradeValueTransformer.new, 
					  forName: "centrigradeFromKelvin"
        
	    NSValueTransformer.setValueTransformer FahrenheitValueTransformer.new, 
					  forName: "fahrenheitFromKelvin"
        
	    NSValueTransformer.setValueTransformer RankineValueTransformer.new, 
					  forName: "rankineFromKelvin"
	end
    
	def applicationDidFinishLaunching(a_notification)
	    centrigrade_from_kelvin = NSValueTransformer.valueTransformerForName("centrigradeFromKelvin")
	    kelvinWaterBoilingPoint = centrigrade_from_kelvin.reverseTransformedValue(100)
	    defaults = { last_temperature:kelvinWaterBoilingPoint }
	    NSUserDefaults.standardUserDefaults.registerDefaults(defaults)
	end
    
	def awakeFromNib
	    @window.title = "Temperature Converter"
	    # programmatically binding
	    binding_options = { NSValueTransformerName: "rankineFromKelvin", NSContinuouslyUpdatesValueBindingOption => true }
	    @rankine_form_cell.bind "value",
			   toObject: @sharedUserDefaultsController,
			withKeyPath: "values.last_temperature",
			    options: binding_options
	end	
end

