

LogDb.delete!
WorldDb.delete!  # danger zone! deletes all records
BeerDb.delete!  # danger zone! deletes all records

WorldDb.read_all( find_world_db_path_from_gemfile_gitref! )


## fix: move to beerdb gem -?

## fix: use a "generic" method
## just pass in 'beer.db'
## e.g. find_path_from_gemfile_gitref!( 'beer.db' )

def find_beer_db_path_from_gemfile_gitref!
  puts "[debug] find_beer_db_path..."
  puts "load path:"
  pp $LOAD_PATH
  
  candidates = []
  $LOAD_PATH.each do |path|
    if path =~ /\/(beer\.db-[a-z0-9]+)|(beer\.db)\//
      candidates << path.dup
    end
  end
  
  puts "found candidates:"
  pp candidates
  
  ## cut-off everything after /beer.db
  # e.g. lib/ruby/gems/1.9.1/bundler/gems/beer.db-38279c414449/lib becomes
  #      lib/ruby/gems/1.9.1/bundler/gems/beer.db-38279c414449
  
  cand = candidates[0]
  
  puts "cand before: #{cand}"
  
  ## nb: *? is non-greedy many operator
  
  ## todo: why not just cut off trailing /lib - is it good enough??
  # it's easier
  
  regex = /(\/beer\.db.*?)(\/.*)/
  cand = cand.sub( regex ) do |_|
    puts "cutting off >>#{$2}<<"
    $1
  end
  
  puts "cand after: #{cand}"
  
  ## todo:exit with error if not found!!!
  
  cand
end


BeerDb.read_all( find_beer_db_path_from_gemfile_gitref! )

## BeerDb.read_setup( 'setups/all', find_football_db_path_from_gemfile_gitref! )

BeerDb.tables
