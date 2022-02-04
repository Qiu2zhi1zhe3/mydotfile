# Default OMZ theme for Archcraft

if [[ "$LOGNAME" == "root" ]]; then
  PROMPT="%F{8}%K{8}%(?:%{$fg_bold[red]%}● %{$fg_bold[yellow]%}● %{$fg_bold[green]%}●%{%k%}%F{0}%f :%{$fg_bold[red]%}%{%k%}%F{8}%f )"
  PROMPT+='%{$fg[cyan]%}  %c%{$reset_color%} $(git_prompt_info)'
else
  PROMPT="%F{8}%K{8}%(?:%{$fg_bold[red]%}● %{$fg_bold[yellow]%}● %{$fg_bold[green]%}●%{%k%}%F{0}%f :%{$fg_bold[red]%}%{%k%}%F{8}%f )"
  PROMPT+='%{$fg[cyan]%}  %c%{$reset_color%} $(git_prompt_info)'
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}  git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
