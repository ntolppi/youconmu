FROM norman12556/manjaro

RUN pacman -Syu --noconfirm && pacman -Sy --noconfirm \
    python python-{requests,beautifulsoup4} pulseaudio youtube-dl ffmpeg lame sed gzip mpg123 \
    && sed -i 's/#en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen \
    && locale-gen \
    && export LANG="en_US.UTF-8" \
    && export LC_ALL="en_US.UTF-8"

ADD ./youtube_search.py /search.py

CMD ["/bin/bash"]
