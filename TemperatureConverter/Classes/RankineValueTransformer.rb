#
#  RankineValueTransformer.rb
#  TemperatureConverter
#
#  Created by Sean Mateus  on 13.05.11.
#  Copyright 2011 Sean Mateus.All rights reserved.
#
class RankineValueTransformer < NSValueTransformer
    def transformedValueClass
	NSNumber
    end
    
    def allowsReverseTransformation
	true
    end
    
    def transformedValue value
	kelvin_input_value = value.doubleValue # handles NSString and NSNumber
	rankine_output_value = kelvin_input_value * 1.8
	rankine_output_value.to_f
    end
    
    def reverseTransformedValue value
	rankine_input_value = value.doubleValue # handles NSString and NSNumber
	kelvin_ouput_value = rankine_input_value / 1.8
	kelvin_ouput_value
    end
end

