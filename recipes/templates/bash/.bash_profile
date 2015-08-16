# Test for an interactive shell. There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [ -f ~/.bash_prompt ]; then
        . ~/.bash_prompt
fi
