
ATTRIBUTES = {
   backgrounds: [ 
         # solid colors 
          'aqua',
          'blue',
          'green',
          'red',
          'yellow',
          'bitcoin-orange',
          'classic',
          'default',  
        # currency patterns
            'bitcoin-pattern',
            'dollar-pattern',
            'euro-pattern',
        # flags and more
            'rainbow',
            'ukraine',
            'usa',
            'austria',
            'great-britain',
            'china',
            'europe',
   ],
   base: [
     'albino-small',
     'brown',
     'dark-small',
     'gray-small',
     'gray',
     'green-small',
     'green',
     'light-small',
     'medium-small',
     'pink-small',
     'pink',
     'purple-small',
     'purple',
     'red',
     'white',
   ## classic specials
       'alien',
       'boned',
       'bot',
       'deathbot',
       'demon',
       'golden',
       'hyena',
       'mempool',
       'pepe-block',
       'pepe',
       'rainbow',
       'safemode',
       'zombie',
   ## more
         'blue-orc',
         'blue',
         'gold-orc',
         'gold',
         'greener-orc',
         'greener',
         'orange-orc',
         'orange',
         'orange2-orc',
         'orange2',
         'punk',
         'squiggle',
         'black',
         'default',
     ],
   'eyes': [
      '3dglasses',
      'shades-blend',
      'shades-rainbow',
      'eyepatch',
      'eyes-big',
      'eyes-big-blue',
      'eyes-bored',
      'eyes-bot',
      'eyes-bot-green',
      'eyes-deathbot',
      'eyes-left',
      'eyes-monobrow',
      'eyes-pepe',
      'eyes-right',
      'eyes-zombie',
      ## more
         'eyemask',
         'eyes-blue',
         'eyes-blue-small',
         'eyes-blue-big',
         'eyes-alien',
         'eyes-demon',
         'lasereyes-red',
         'lasereyes-blue',
         'lasereyes-green',
         'lasereyes-gold',
         'lasereyes-punk',
         'vr',
         'shades-polarized',
         'shades-cool',
   ],
   'accessories': [
      'bandana',
      'bandana2',
      'bowler',
      'cap-army',
      'cap-mcb',
      'cap-ordinal',
      'cap-safemode',
      'cap-terminal',
      'cap-terminal2',
      'cap-captain',
      'cap',
      'cowboyhat',
      'crown',
      'earring',
      'earring-cross',
      'fez',
      'flathat',
      'frenchcap',
      'halo',
      'knittedcap',
      'knittedcap2',
      'policecap',
      'wizardhat',  
      ## more
         'bubblegum',
         'beanie',
         'cap-burgerking',
         'cap-mcd-black',
         'cap-mcd-red',
         'cap-mcd-white',
         'cap-subway',
         'jesterhat',   
         'helmet',  
         'helmet2',  
         'tophat',
         'tophat-midnight',
         'wizardhat-blue',
         'wizardhat-orange',
         'wizardhat-red',
         'wizardhat-dark',
         'wizardhat-gray',
         'wizardhat-midnight',
         'wizardhat-gold',
         'wizardhat-green',
         'wizardhat-white',
         'headband',       
      ## hoodies
      'hoodie',
      'hoodie-midnight',
      'hoodie-indigo',
      'hoodie-blue',
      'hoodie-cobalt',
      'hoodie-aqua',
      'hoodie-green',
      'hoodie-greener',
      'hoodie-limegreen',
      'hoodie-gold',
      'hoodie-orange',
      'hoodie-ruby',
      'hoodie-red',
      'hoodie-purple',
      'hoodie-pink',
   ], 
   hair: [
       'bob',
       'bob-small',
       'bob-blonde-small',
       'bob-red-small',
       'mohawk',
       'mohawk-blonde',
       'mohawk-green',
       'mohawk-purple',
       'mohawk-red',
       'mohawk2',
       'mohawk2-blonde',
       'mohawk2-green',
       'mohawk2-purple',
       'mohawk2-red',
       'mohawk2-orange',
       'mohawk2-pink',
       'peakspike',
       'peakspike-purple',
       'peakspike-red',
       'peakspike-blonde',
   ],
  maxibiz: [
   'maxibiz',
   'maxibiz2',
   'maxibiz3',
   'maxibiz4',
   'maxibiz5',
   'maxibiz6',
   'maxibiz-punk',
   'maxibiz-punk2',
 
   '3dglasses-1bit',
   'bandana-1bit',
   'bubblegum-1bit',
   'cap-mcb-1bit',
   'cap-ordinal-1bit',
   'cap-terminal-1bit',
   'cowboyhat-1bit',
   'eyes-1bit',
   'flathat-1bit',
   'knittedcap-1bit',
   'maxibiz-lasereyes-blue',
   'maxibiz-lasereyes-green',
   'maxibiz-lasereyes-red',
   'maxibiz-lasereyes2-blue',
   'maxibiz-lasereyes2-green',
   'maxibiz-lasereyes2-red',
  ],
}.reduce( {} ) do |h,(category, names)| 
     names.each do |name|
        key = File.basename( name ).downcase.gsub( /[^a-z0-9]/, '' )

        ## fix-up names by category 
        key = "bg#{key}"    if category == :backgrounds

        ## fix-up file path by category
        path =  category == :base ? name : "#{category}/#{name}"

        puts "  #{key} / #{category}"
        if h.has_key?( key )
          puts "!! ERROR - duplicate key >#{key}<; already in use; sorry"
          exit 1
        end

        h[ key ] = Image.read( "./attributes/#{path}.png" )
     end
     h
end




def generate( *attributes )
   base = Image.new( 28,28 )
   attributes.each do |attrib|
        key = attrib.downcase.gsub( /[^a-z0-9]/, '' )
        img = ATTRIBUTES[ key ]
        if img.nil?
           puts "!! #{attrib} with key #{key} not found; sorry"
           exit 1
        end
        base.compose!( img )
   end
   base
end



