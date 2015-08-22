# Load custom Bash prompt if it exists
# ------------------------------------------------------------
if [ -f ~/.bash_prompt ]; then
        . ~/.bash_prompt
fi

# -- Google Cloud --
# ------------------------------------------------------------
  source '/Users/jdoyle/google-cloud-sdk/path.bash.inc' # Google Cloud SDK.
  source '/Users/jdoyle/google-cloud-sdk/completion.bash.inc' # CLI completion for gcloud.