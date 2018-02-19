#FROM lsiobase/alpine.python
FROM python
MAINTAINER lksz <code@lksz.me>

ENV OD_ROOT "/odrive-agent"
WORKDIR /odrive-agent

# Install odrive Sync Agent
RUN    od="$OD_ROOT/bin" \
    && curl -L "https://dl.odrive.com/odrive-py" --create-dirs -o "$od/odrive.py" \
    && ( curl -L "https://dl.odrive.com/odriveagent-lnx-64" | tar -xvzf- -C "$od/" ) \
    && ( curl -L "https://dl.odrive.com/odrivecli-lnx-64" | tar -xvzf- -C "$od/" )

COPY    od_root/* /odrive-agent/
RUN     chmod u+x "$OD_ROOT/"*.sh

VOLUME /data
VOLUME /root/.odrive-agent

ENV PATH = $PATH:$OD_ROOT/bin/

# Run the odrive Sync Agent server in the background
#ENTRYPOINT nohup "$OD_ROOT/bin/odriveagent" > /var/log/odriveagent.log
CMD ["/odrive-agent/start.sh"]

