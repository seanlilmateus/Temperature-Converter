#
#  CentigradeValueTransformer.rb
#  TemperatureConverter
#
#  Created by Sean Mateus  on 13.05.11.
#  Copyright 2011 Sean Mateus.All rights reserved.
#
class CentigradeValueTransformer < NSValueTransformer
    def transformedValueClass
        NSNumber
    end
    
    def allowsReverseTransformation
        true
    end
    
    def transformedValue value
        kelvin_input_value = value.doubleValue # handles NSString and NSNumber
        centigrade_output_value = kelvin_input_value - 273.15
    end
    
    def reverseTransformedValue value
        centigrade_input_value = value.doubleValue # handles NSString and NSNumber
        kelvin_output_value = centigrade_input_value + 273.15        
    end
end

