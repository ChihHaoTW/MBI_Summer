require! <[fs async line-reader]>

input_file = \res/N225_2012.csv
output_file = \feature

orig_data = []
feature_data = []
last_close = 0

parse_data = ->
  async.eachSeries orig_data.reverse!, (file, cb) ->
    if last_close == 0
      last_close := file[\close]
      cb!
    else
      <- fs.appendFile output_file, (if file[\close] >= last_close then \1 else \-1) + "\t1:" + ((file[\close]-file[\low])-(file[\high]-file[\close]))/(file[\high]-file[\low]) + "\n", (err) ->
        if err 
          console.log 'The "data to append" was appended to file!'
      last_close := file[\close]
      cb!
  , (err) ->

lineReader.eachLine input_file, (line) ->
  # console.log line
  if /(.+?),(.+?),(.+?),(.+?),(.+?),(.+?),(.+)/ == line
    orig_data.push {date:parseInt(that.1), open:parseInt(that.2), high:parseInt(that.3), low:parseInt(that.4), close:parseInt(that.5), volume:parseInt(that.6), adj:parseInt(that.7)}
    # console.log orig_data
.then parse_data


# vi:et:sw=2:ts=2
