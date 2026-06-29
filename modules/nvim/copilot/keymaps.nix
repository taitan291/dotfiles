{
  programs.nixvim = {
    keymaps = [
      {
        mode = ["n" "v"];
        key = "<leader>cct";
        action = "<cmd>CopilotChatToggle<cr>";
        options = {
          desc = "CopilotChat: Toggle";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<leader>cce";
        action = "<cmd>CopilotChatExplain<cr>";
        options = {
          desc = "CopilotChat: Explain code";
          silent = true;
        };
      }
      {
        mode = ["n"];
        key = "<leader>ccq";
        action = "<cmd>lua CopilotChatBuffer()<cr>";
        options = {
          desc = "CopilotChat: Toggle";
          silent = true;
        };
      }
    ];
  };
}
