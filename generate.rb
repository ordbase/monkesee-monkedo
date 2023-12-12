require 'pixelart'

require_relative 'base'




specs = read_csv( "./monkesee-monkedo.csv" )


cols = 200
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite = ImageComposite.new( cols, rows, 
                                  width: 28, height: 28 )




specs.each_with_index do |rec, i|
     base        = rec['type']
     accessories = (rec['accessories'] || '' ).split( '/').map { |acc| acc.strip }
     background  = rec['background']
     
     spec = ["bg #{background}", base] + accessories

     img = generate( *spec )
      
     num = "%05d" % i
     puts "==> monke #{num}"
     img.save( "./i/monke#{num}.png" )
     img.zoom(8).save( "./i@8x/monke#{num}@8x.png" )
     
     composite << img
end


composite.save( "./monkesee-monkedo.png" )

puts "bye"
