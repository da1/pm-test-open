PmTestOpenView = require './pm-test-open-view'

module.exports =
  pmTestOpenView: null

  activate: (state) ->
    @pmTestOpenView = new PmTestOpenView(state.pmTestOpenViewState)
    atom.workspaceView.command "pm-test-open:open", => @open()

  deactivate: ->
    @pmTestOpenView.destroy()

  serialize: ->
    pmTestOpenViewState: @pmTestOpenView.serialize()

  open: ->
    uri = atom.workspace.activePaneItem.getUri()
    rootDirectory = atom.project.rootDirectory
    directoryPath = rootDirectory.getPath()
    relativePath = uri.substr(directoryPath.length + 1)
    testFilePath = directoryPath + "/t/" + relativePath.replace(/\.pm$/, ".t")

    if rootDirectory.contains(testFilePath)
      atom.workspace.open(testFilePath)
    else
      console.log rootDirectory + " not exists"
