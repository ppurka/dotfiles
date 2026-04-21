local status_ok, codecompanion = pcall(require, "codecompanion")
if not status_ok then
  return
end

local model_ = "gemma3:latest" -- "qwen2.5-coder:7b"

codecompanion.setup {
    -- This 'strategies' table sets the DEFAULT AI PROVIDER and MODEL
    -- for different categories of actions within the plugin.
    strategies = {
      -- Configures the default model for running custom prompts.
      cmd = {
        adapter = "ollama",
        model = model_,
      },

      -- Configures the model for the interactive chat window (:CompanionChat).
      chat = {
        adapter = "ollama",
        model = model_,
      },

      -- Configures the model for any action that modifies code directly in your buffer
      -- using the 'inline' strategy.
      inline = {
        adapter = "ollama",
        model = model_,
      },
    },
}
