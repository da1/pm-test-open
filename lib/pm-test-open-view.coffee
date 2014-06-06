{View} = require 'atom'

module.exports =
class PmTestOpenView extends View
  @content: ->
    @div class: 'pm-test-open overlay from-top', =>
      @div "The PmTestOpen package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "pm-test-open:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "PmTestOpenView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
