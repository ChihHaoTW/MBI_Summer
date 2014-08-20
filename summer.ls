require! <[async line-reader]>

input_file = \res/N225_2012.csv

data = []

#async.series

read_file = (file_name) ->
  lineReader.eachLine file_name, (line) ->
    # console.log line
    if /(.+?),(.+?),(.+?),(.+?),(.+?),(.+?),(.+)/ == line
      data.push {date:that.1, open:that.2, high:that.3, low:that.4, close:that.5, volume:that.6, adj:that.7}
      # console.log data

read_file input_file

# vi:et:sw=2:ts=2
