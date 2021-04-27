function mongo-service --argument type
  set -l command "start"
  if test -z $type
    set comamnd "start"
  else if test $type  = "stop"
    set command "stop"
  end
  brew services $command mongodb-community@4.4
end
