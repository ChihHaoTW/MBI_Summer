require! <[fs sh]>

passwd = \homework/passwd

(err, data) <- fs.readFile passwd
if err
  console.log data
else
  output <- sh('ls ' + process.argv[2]).result
  #console.log output
  for name in output / '\n'
    if name is /(.+)/
      sh('chown -R ' + that[1] + ' ' + process.argv[2] + \/ + that[1] + \/);
      sh('chgrp -R ' + that[1] + ' ' + process.argv[2] + \/ + that[1] + \/);

# vi:et:sw=2:ts=2
