FROM debian:buster

RUN apt-get update -q

#
# jackd
#

RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq jackd1 libx11-6 python zenity

COPY start.sh stereo_tool_gui_jack_64 /
RUN chmod +x /start.sh /stereo_tool_gui_jack_64

CMD ["/start.sh"]
