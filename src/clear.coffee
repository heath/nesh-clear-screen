# A plugin which makes clearing the screen convenient

exports.postStart = (context) ->
  {repl} = context
  repl.inputStream.on "keypress", (char, key) ->
    return unless key and key.ctrl and not key.meta and not key.shift and key.name is "l"
    repl.outputStream.write "\u001B[2J\u001B[0;0f"
    repl.displayPrompt()
