local status_ok, codecompanion = pcall(require, "codecompanion")
if not status_ok then
  return
end

codecompanion.setup {
    -- This 'strategies' table sets the DEFAULT AI PROVIDER and MODEL
    -- for different categories of actions within the plugin.
    strategies = {
      -- Configures the default model for running custom prompts.
      cmd = {
        adapter = "ollama",
        model = "qwen2.5-coder:7b",
      },

      -- Configures the model for the interactive chat window (:CompanionChat).
      chat = {
        adapter = "ollama",
        model = "qwen2.5-coder:7b",
      },

      -- Configures the model for any action that modifies code directly in your buffer
      -- using the 'inline' strategy.
      inline = {
        adapter = "ollama",
        model = "qwen2.5-coder:7b",
      },
    },
}
