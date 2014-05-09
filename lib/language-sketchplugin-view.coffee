{View} = require 'atom'

module.exports =
class LanguageSketchpluginView extends View
  @content: ->
    @div class: 'language-sketchplugin overlay from-top', =>
      @div "The LanguageSketchplugin package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "language-sketchplugin:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "LanguageSketchpluginView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
