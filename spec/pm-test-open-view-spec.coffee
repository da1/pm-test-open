PmTestOpenView = require '../lib/pm-test-open-view'
{WorkspaceView} = require 'atom'

describe "PmTestOpenView", ->
  it "has one valid test", ->
    expect("life").toBe "easy"
