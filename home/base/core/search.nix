{ pkgs, ... }: {
  programs.fzf = {
    enable = true;
    colors = {
      "bg+" = "#ccd0da";
      spinner = "#dc8a78";
      hl = "#d20f39";
      fg = "#4c4f69";
      header = "#d20f39";
      info = "#8839ef";
      pointer = "#dc8a78";
      marker = "#7287fd";
      "fg+" = "#4c4f69";
      prompt = "#8839ef";
      "hl+" = "#d20f39";
      selected-bg = "#bcc0cc";
    };
    
  };

  # https://github.com/BurntSushi/ripgrep
  programs.ripgrep = {
    enable = true;
  };

}