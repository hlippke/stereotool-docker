FROM debian:buster

RUN apt-get update -q

#
# jackd
#

RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq jackd1 libx11-6 python zenity


CMD ["bash"]

