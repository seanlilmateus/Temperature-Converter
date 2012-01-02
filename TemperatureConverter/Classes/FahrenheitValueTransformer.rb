#
#  FahrenheitValueTransformer.rb
#  TemperatureConverter
#
#  Created by Mateus Kimbango Armando on 13.05.11.
#  Copyright 2011 Sean Coorp. INC. All rights reserved.
#
class FahrenheitValueTransformer < NSValueTransformer
        
    def transformedValueClass
			NSNumber
    end
    
    def allowsReverseTransformation
			true
    end
    
    def transformedValue value
			centigrade_from_Kelvin = NSValueTransformer.valueTransformerForName "centrigradeFromKelvin"
			value = centigrade_from_Kelvin.transformedValue value # convert from kelvin to centigrade
			centigrade_interim_value = value.doubleValue # handles NSString and NSNumber
			fahrenheit_output_value = (1.8 * centigrade_interim_value) + 32
			fahrenheit_output_value.to_f
    end
    
    def reverseTransformedValue value
			centigrade_fromKelvin = NSValueTransformer.valueTransformerForName "centrigradeFromKelvin"        
			fahrenheit_input_value = value.doubleValue
			centigrade_interim_value = (fahrenheit_input_value - 32.0) / 1.8
			# convert from centigrade to kelvin and return....
			centigrade_fromKelvin.reverseTransformedValue centigrade_interim_value
    end
end



