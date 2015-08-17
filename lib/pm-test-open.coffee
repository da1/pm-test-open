PmTestOpenView = require './pm-test-open-view'
{CompositeDisposable} = require 'atom'

module.exports =
  pmTestOpenView: null

  activate: (state) ->
    @pmTestOpenView = new PmTestOpenView(state.pmTestOpenViewState)
    atom.commands.add 'atom-workspace', 'pm-test-open:open', => @open()
    atom.commands.add 'atom-workspace', 'pm-test-open:openModule', => @openModule()

  deactivate: ->
    @pmTestOpenView.destroy()

  serialize: ->
    pmTestOpenViewState: @pmTestOpenView.serialize()

  open: ->
    uri = atom.workspace.getActivePaneItem().getURI()
    rootDirectory = atom.project.rootDirectories[0]
    directoryPath = rootDirectory.getPath()
    relativePath = uri.substr(directoryPath.length + 1)
    testFilePath = directoryPath + "/t/" + relativePath.replace(/\.p(m|l)$/, ".t")

    atom.workspace.open(testFilePath)

  openModule: ->
    uri = atom.workspace.getActivePaneItem().getURI()
    rootDirectory = atom.project.rootDirectories[0]
    directoryPath = rootDirectory.getPath()
    relativePath = uri.substr(directoryPath.length + 1)
    filePath = directoryPath + "/" + relativePath.replace(/^t\//, "").replace(/\.t$/, ".pm")

    atom.workspace.open(filePath)
