if Meteor.isClient
  generateColor = ->
    "#" + ("000000" + Math.floor(Math.random() * 16777215).toString(16))
      .slice(-6).toUpperCase()

  setBackgroundColor = (color) ->
    document.getElementsByTagName('body')[0]
      .style.backgroundColor = color

  cycle = (color) ->
    color ||= generateColor()
    window.location.hash = color

  Meteor.startup ->
    if window.location.hash
      setBackgroundColor(window.location.hash)
    else
      cycle()

    window.onhashchange = ->
      setBackgroundColor(window.location.hash)

  Template.overlay.events
    "click #trigger": ->
      cycle()

if Meteor.isServer
  Meteor.startup ->