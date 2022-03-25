function gitlfzf
  set -l _git_log_line_to_hash "echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
  set -l _git_view_commit "$_git_log_line_to_hash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy | less -R'"
  set -l _git_copy_commit_hash "$_git_log_line_to_hash | xclip -r clipboard"

  git log \
    --color=always \
    -n 500 \
    --abbrev=7 \
    --graph \
    --format="%C(cyan)%h %C(blue)%ar%C(auto)%d %C(yellow)%s%+b %C(black)%ae" |
    fzf -i -e \
      --reverse \
      --tiebreak=index \
      --no-multi \
      --ansi \
      --preview "echo {} |
                  grep -o '[a-f0-9]\{7\}' |
                  head -1 |
                  xargs -I % sh -c 'git show --color=always % |
                  diff-so-fancy'" \
      --header "enter: view commit, alt-c: copy hash" \
      --bind "enter:execute:($_git_view_commit)" \
      --bind "alt-c:execute:($_git_copy_commit_hash)"
end
