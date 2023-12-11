require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA ) 
   bg usa, pink, eyes blue,  earring cross
   bg usa, pink small, eyes blue small, hoodie pink
   bg usa, red, eyes blue, mohawk blonde
   bg usa, demon, hoodie ruby, halo
   
   bg great britain, purple, mohawk
   bg great britain, greener orc, eyemask, earring cross, mohawk
   bg china, red,  mohawk
   bg europe, red, mohawk
   bg austria, gold orc,  mohawk2 orange, lasereyes red

   bg aqua, pink small, eyes blue small, bob blonde small
   bg rainbow, pink small, eyes big, eyes blue big, bob red small
   bg ukraine, pink small, eyes blue,  bob small
   bg bitcoin pattern, pink small, bob blonde small, lasereyes blue
 
   bg bitcoin pattern, orange orc, mohawk red, lasereyes red
   bg bitcoin pattern, orange orc, hoodie orange, lasereyes red
   bg bitcoin pattern, orange orc, wizardhat orange, lasereyes red
   bg dollar pattern, greener orc, mohawk green, eyemask
   bg dollar pattern, greener orc, hoodie green, eyemask
   bg dollar pattern, greener orc, eyes bot green, wizardhat green

   bg euro pattern, blue orc,  mohawk purple
   bg euro pattern, blue orc,  hoodie midnight
   bg euro pattern, blue orc, eyes bot, wizardhat midnight
   squiggle, eyes left
   punk, lasereyes punk

   bg classic,  alien, headband
   alien, cap mcd red
   boned, cap mcd black
   bot, cap mcd white
   deathbot, cap subway
   demon,  cap mcb
   golden, cap mcb
   hyena, cap burgerking
  
   pepe,  cap mcd red
   
   brown,  beanie, bubblegum
   brown, jesterhat, bubblegum
   gray,  helmet
   green, helmet2
   pink,  beanie
  
   bot, vr
   zombie, vr
   pink small, vr, hoodie pink
    white, vr, tophat, bubblegum

      dark small, shades cool, peakspike
      medium small, shades polarized, peakspike purple
    
      bg default, default
      bg red, black,   shades cool
      bg default, default, 3d glasses
      bg default, default, shades polarized
      bg default, default, knitted cap
    
      bg bitcoin orange, maxibiz,   maxibiz lasereyes red
      bg bitcoin orange, maxibiz2,   maxibiz lasereyes green
      bg bitcoin orange, maxibiz3,   maxibiz lasereyes blue
      bg bitcoin orange, maxibiz4, cap mcb 1bit,   maxibiz lasereyes2 red
      bg bitcoin orange, maxibiz5,   maxibiz lasereyes2 green
      bg bitcoin orange, maxibiz6, cap ordinal 1bit,  maxibiz lasereyes2 blue
      bg bitcoin orange, maxibiz punk,  mohawk, maxibiz lasereyes red
      bg bitcoin orange, maxibiz punk2, mohawk2,  maxibiz lasereyes blue
DATA




cols = 10
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite = ImageComposite.new( cols, rows, 
                                  width: 28, height: 28 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./tmp/monke#{i}.png" )
     img.zoom(10).save( "./tmp/monke#{i}@10x.png" )
     composite << img

end


composite.save( "./tmp/monkes.png" )
composite.zoom(4).save( "./tmp/monkes@4x.png" )


puts "bye"
