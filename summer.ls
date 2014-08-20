require! <[fs async line-reader]>

input_file = \res/N225_2012.csv

orig_data = []
feature_data = []

parse_data = ->
  for data in orig_data
    console.log data[\date]

lineReader.eachLine input_file, (line) ->
  # console.log line
  if /(.+?),(.+?),(.+?),(.+?),(.+?),(.+?),(.+)/ == line
    orig_data.push {date:that.1, open:that.2, high:that.3, low:that.4, close:that.5, volume:that.6, adj:that.7}
    # console.log orig_data
.then parse_data


# vi:et:sw=2:ts=2
