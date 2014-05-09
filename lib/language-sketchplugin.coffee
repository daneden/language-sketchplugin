LanguageSketchpluginView = require './language-sketchplugin-view'

module.exports =
  languageSketchpluginView: null

  activate: (state) ->
    @languageSketchpluginView = new LanguageSketchpluginView(state.languageSketchpluginViewState)

  deactivate: ->
    @languageSketchpluginView.destroy()

  serialize: ->
    languageSketchpluginViewState: @languageSketchpluginView.serialize()
