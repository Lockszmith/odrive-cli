FROM python

# Install odrive Sync Agent
RUN od="$HOME/.odrive-agent/bin" && curl -L "https://dl.odrive.com/odrive-py" --create-dirs -o "$od/odrive.py" && curl -L "https://dl.odrive.com/odriveagent-lnx-64" | tar -xvzf- -C "$od/" && curl -L "https://dl.odrive.com/odrivecli-lnx-64" | tar -xvzf- -C "$od/"

ENV ODRIVEAGENT = $HOME/.odrive-agent/

ENV PATH = $PATH:$ODRIVEAGENT/bin/

# Run the odrive Sync Agent server in the background
# ENTRYPOINT $HOME/.odrive-agent/bin/

CMD nohup "odriveagent" > odriveagent.log &
