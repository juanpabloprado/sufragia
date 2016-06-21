$ ->
  faye = new Faye.Client('http://sufragia.cloudapp.net:9292/faye')
  faye.subscribe '/campaigns/new', (data) ->
    eval(data)

