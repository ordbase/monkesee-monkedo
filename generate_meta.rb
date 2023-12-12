

## add some core ext helpers
class Array
  def excluding(*elements) self - elements.flatten; end
end


CATEGORIES = {
  'base' => [
    ['dark small', 'medium small', 'light small', 'albino small'],
    'brown',
    ['gray small','gray'],
    ['green small', 'green'],
    'pink small',   ## skip pink - always use small version for barbie
    ['purple small','purple'],
    
    ['red', 'white'],  ## alternate red white
  ## classic specials
      'alien',
       'boned',
      'bot',
      'deathbot',
      'demon',
      'golden',
      'hyena',
      'mempool',
      ['pepe', 'pepe', 'pepe', 'pepe', 'pepe block'],
      'rainbow',
      'safemode',
      'zombie',
  ## more
        ['blue orc', 'blue orc', 'blue'],
        ['greener orc', 'greener orc', 'greener'],
        ['orange orc', 'orange orc', 'orange', 'orange2 orc', 'orange2 orc', 'orange2'],
        ['gold orc', 'gold orc', 'gold'],
        
        'black',
        'default',

        ['maxibiz', 'maxibiz2', 'maxibiz3', 'maxibiz4',
         'maxibiz5',
         'maxibiz6',
          # 'maxibiz punk',  - no maxibiz punks for now
          # 'maxibiz punk2',
         ## more ultra-rare 1/1s
         'punk', 'squiggle'],
      ],

  ## use for maxibiz/black/default    
  'hair_black' => [
                  'mohawk', 'mohawk2',
                  'peakspike',
                  'bob',     ## exclusive 
                ],  
                  
  'hair' => [
        'mohawk',
        'mohawk blonde',
        'mohawk green',
        'mohawk purple',
        'mohawk red',
        'mohawk2',
        'mohawk2 blonde',
        'mohawk2 green',
        'mohawk2 purple',
        'mohawk2 red',
        'mohawk2 orange',
        'mohawk2 pink',
        'peakspike',
        'peakspike purple',
        'peakspike red',
        # 'peakspike blonde',
  ],
  ## use for pink (barbie)
  'hair_blonde_f' => [ 
          'mohawk blonde', 'mohawk2 blonde',
          'peakspike blonde',           ## exclusive
          'bob blonde small',           ## exclusive
          ['bob blonde small', 'headband'],   ## exclusive hair+hat combos
          ['bob blonde small', 'knittedcap'],
          ['bob blonde small', 'cap mcd red'],
          ['bob blonde small', 'frenchcap'],
     ],   

  'hat' => [
    'bandana',
      'bandana2',
      'bowler',
      'cap army',
      'cap mcb',
      'cap ordinal',
      'cap safemode',
      'cap terminal', 'cap terminal2',
      'cap captain',
      'cap',
      'cowboyhat',
      'crown',
      'fez',
      'flathat',
      'knittedcap',
      'knittedcap2',
      'policecap',
      'wizardhat',  
         'beanie',
         'cap burgerking',
         'cap mcd black',
         'cap mcd red',
         'cap mcd white',
         'cap subway',
         'jesterhat',   
         'helmet',  
         'helmet2',  
         'tophat',
         'tophat midnight',
         'wizardhat blue',
         'wizardhat orange',
         'wizardhat red',
         'wizardhat dark',
         'wizardhat gray',
         'wizardhat midnight',
         'wizardhat gold',
         'wizardhat green',
         'wizardhat white',
         'headband',       
  ],
   'hoodies' => [
    'hoodie',
    'hoodie midnight',
    'hoodie indigo',
    'hoodie blue',
    'hoodie cobalt',
    'hoodie aqua',
    'hoodie green',
    'hoodie greener',
    'hoodie limegreen',
    'hoodie gold',
    'hoodie orange',
    'hoodie ruby',
    'hoodie red',
    'hoodie purple',
   ],
   'hoodies_blonde_f' => [
    'hoodie orange',
    'hoodie pink',   ## exclusive
   ],
   'hat_blonde_f' => [   ### no top hats, no headband - what else?
     'bandana',
     'bandana2',
     'bowler',
    'cap army',
    'cap mcb',
    'cap ordinal',
    'cap safemode',
    'cap terminal',
    'cap terminal2',
    'cap captain',
    'cap',
    'cowboyhat',
    'crown',
    'fez',
    'knittedcap',
    'knittedcap2',
    'policecap',
    'wizardhat',  
       'beanie',
       'cap burgerking',
       'cap mcd black',
       'cap mcd red',
       'cap mcd white',
       'cap subway',
       'jesterhat',   
       'helmet',  
       'helmet2',  
       'wizardhat blue',
       'wizardhat orange',
       'wizardhat red',
       'wizardhat dark',
       'wizardhat gray',
       'wizardhat midnight',
       'wizardhat gold',
       'wizardhat green',
       'wizardhat white',
    'frenchcap',  ## exclusive
],

'lasereyes_black' => [
  'maxibiz lasereyes blue',
  'maxibiz lasereyes green',
  'maxibiz lasereyes red',
  'maxibiz lasereyes2 blue',
  'maxibiz lasereyes2 green',
  'maxibiz lasereyes2 red',
],
'lasereyes' => [
  'lasereyes red',
  'lasereyes green',
  'lasereyes gold',
],
'lasereyes_blonde_f' => [
  'lasereyes blue',   # exclusive
],

'eyes' => [
  '3d glasses',
  'shades blend',
  'shades rainbow',
  'shades polarized',
  'shades cool',    ## exclusive (to non-blondes)
  'eyepatch',
  'eyes big',
  'eyes bored',
  'eyes bot',
  'eyes bot green',
  'eyes deathbot',
  'eyes monobrow',
  'eyes pepe',
  'eyes right',
  'eyes zombie',
     'eyemask',
     'vr',
],
'eyes_blonde_f' => [
  '3d glasses',
  'shades blend',
  'shades rainbow',
  'shades polarized',
  'eyepatch',
  'eyes big blue',
  'eyes bot',
  'eyes deathbot',
  # 'eyes bored',
  # 'eyes monobrow',
  # 'eyemask',
   'vr',
], 
 'more' => [
  'earring',   ##  make earrings 3x
  'earring cross',
  'earring',
  'earring cross',
  'earring',
  'earring cross',
  'halo',
  'bubblegum', 
 ],
} 


pp CATEGORIES


def random_attributes( base )
  attributes = []

  style  =  if ['black', 'default' ].include?( base ) || base.index( 'maxibiz' )     ## maxibiz/black/default 
               :black 
            elsif ['pink small'].include?( base )  ## pink (barbie)
               :blonde
            elsif  ['squiggle'].include?( base )   
               :squiggle  ## squiggle 1/1
            elsif  ['punk'].include?( base )
               :punk      ## golden punk 1/1
            else                       ## "standard" humans incl. orc
               :default
            end

  hair_attributes =  case style
                      when :black then   CATEGORIES['hair_black']
                      when :blonde then  CATEGORIES['hair_blonde_f']
                      when :squiggle then   nil  # no hair
                      else               CATEGORIES['hair']  
                      end

  hat_attributes =   case style
                     when :blonde then  CATEGORIES['hat_blonde_f'] + CATEGORIES['hoodies_blonde_f']
                     when :squiggle then    nil  # not hat (+ hoodies)
                     else               CATEGORIES['hat']  + CATEGORIES['hoodies']
                     end

   eyes_attributes =    case style
                        when :black    then  CATEGORIES['eyes']+CATEGORIES['lasereyes_black']
                        when :blonde   then  CATEGORIES['eyes_blonde_f']+CATEGORIES['lasereyes_blonde_f']
                        when :punk     then  CATEGORIES['eyes'].excluding( 'eyepatch' ) + ['lasereyes-punk','lasereyes-punk','lasereyes-punk','lasereyes-punk','lasereyes-punk']
                        when :squiggle then  CATEGORIES['eyes'].excluding( 'eyepatch' )
                        else               CATEGORIES['eyes']+CATEGORIES['lasereyes']
                        end

  more_attributes = case style
                    when :squiggle   then nil   
                    else                CATEGORIES['more'] 
                    end

   ##   0,1  - hair   (20%)
   ##   2,3,4,5,6,7,8 - hat (70%)
   ##   9 -none           (10%) 
   hair_dist, hat_dist =  case style 
                          when :blonde then [[0,1,2,3,4], [5,6,7,8],]  # more hair
                          else              [[0,1],[2,3,4,5,6,7,8],]   # more hats 
                          end
   hair_or_hat  = rand( 10 )
   if hair_dist.include?( hair_or_hat ) && hair_attributes
      attributes << hair_attributes[ rand( hair_attributes.size ) ]
   elsif hat_dist.include?( hair_or_hat ) && hat_attributes
      attributes << hat_attributes[ rand( hat_attributes.size ) ]
   else
     ## none; continue
   end



  if more_attributes
    more  = rand( 100 )
    more_dist = style == :blonde ? [0,1,2,3,4,5,6,7,8,9] : [0]  #  9% or  1%
    if more_dist.include?( more )
       attributes << more_attributes[ rand( more_attributes.size ) ]
    else
      ## none; continue
    end
  end


   ## 70% if hair or hat
   ## 90% if no hair or hat
   eyes  = rand( 10 )
   eyes_dist =   hair_or_hat == 9 ?  [0,1,2,3,4,5,6,7,8] : [0,1,2,3,4,5,6]
   if eyes_dist.include?( eyes ) || [:punk, :squiggle].include?( style )    ## punk & squiggle always get eyes
      attributes << eyes_attributes[ rand( eyes_attributes.size ) ]
   else
     ## none; continue
   end



   ## note: might included nested attributes (combos) - flatten
   attributes.flatten
end



def generate_meta( max=1000, seed: 4242 )

  srand( seed )   ## make deterministic

  recs = []

  backgrounds = [ 
    'bitcoin pattern',
    'red',  
    'green',  
    'dollar pattern', 
    'blue',
    'euro pattern',
    'aqua',
    'classic',
    'rainbow',
    'ukraine',
    'usa',
    'china',
    'great britain',
    'europe',
    'austria',
  ] 
  bases  = CATEGORIES['base']

  ## track uniques (that is, duplicates)
  uniques = Hash.new(0)

  id = 0
  loop do
      base_candidates = bases[ id % bases.size ] 
      base = base_candidates.is_a?( Array ) ? base_candidates[ rand( base_candidates.size) ] :  base_candidates

      accessories = random_attributes( base )

      bg =  if base.index( 'default' )
              'default'   ### bg default exclusive for default
            elsif base.index( 'maxibiz' )
              'bitcoin orange'
            elsif base.index( 'greener' ) 
              'dollar pattern'
            elsif base.index( 'blue' ) 
              'euro pattern'
            elsif base.index( 'orange' ) 
              'bitcoin pattern'
            elsif base.index( 'gold' ) && !base.index( 'golden') 
              'yellow'   ## bg yellow exclusive for gold
            else
               backgrounds[id % backgrounds.size ] 
            end

      attributes = [bg, base] + accessories
      print "==> #{id}: "
      pp attributes

      ## downcase and remove non alphnum - to normalize key (names)
      key = attributes.map { |attr| attr.downcase.gsub( /[^a-z0-9]/, '') }.join('+')
      if uniques.has_key?( key )
        puts "!!  WARN - duplicate: #{attributes.inspect}; retry"
        uniques[ key ] += 1
        next
      else
        uniques[ key ] += 1
      end

    rec = []
    rec << id.to_s   ## add id - starting at one
    rec << base
    rec << accessories.join(' / ')
    rec << bg

    recs << rec

    id += 1
    break if id >= max
  end

##
#  dump duplicates for stats
  puts "duplicates:"
  uniques.each do |key,count|
     puts "  #{count} - #{key}"   if count > 1
  end

  recs
end



recs = generate_meta( 21000 )
## pp recs


headers = ['id', 'type', 'accessories', 'background']
File.open( "./monkesee-monkedo.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   recs.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end


puts "bye"


