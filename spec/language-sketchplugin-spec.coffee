{WorkspaceView} = require 'atom'
LanguageSketchplugin = require '../lib/language-sketchplugin'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "LanguageSketchplugin", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('language-sketchplugin')

  describe "when the language-sketchplugin:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.language-sketchplugin')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'language-sketchplugin:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.language-sketchplugin')).toExist()
        atom.workspaceView.trigger 'language-sketchplugin:toggle'
        expect(atom.workspaceView.find('.language-sketchplugin')).not.toExist()
