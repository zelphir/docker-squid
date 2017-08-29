#!/usr/bin/env bash -e

# Copyright (c) 2016-2017, rockyluke
#
# Permission  to use,  copy, modify,  and/or  distribute this  software for  any
# purpose  with  or without  fee  is hereby  granted,  provided  that the  above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS"  AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO  THIS SOFTWARE INCLUDING  ALL IMPLIED WARRANTIES  OF MERCHANTABILITY
# AND FITNESS.  IN NO EVENT SHALL  THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR  CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER  RESULTING FROM
# LOSS OF USE, DATA OR PROFITS,  WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER  TORTIOUS ACTION,  ARISING  OUT OF  OR  IN CONNECTION  WITH  THE USE  OR
# PERFORMANCE OF THIS SOFTWARE.

# Squid latest
docker build --force-rm --tag ${USER}/squid:latest .

# Squid 3.5.27
docker build --force-rm --tag   ${USER}/squid:3.5.27 3.5.27
docker tag ${USER}/squid:3.5.27 ${USER}/squid:3.5

# Squid 4.0.21
docker build --force-rm --tag   ${USER}/squid:4.0.21 4.0.21
docker tag ${USER}/squid:4.0.21 ${USER}/squid:4.0

# Tests
clear
echo -n 'latest: ' && docker run --rm ${USER}/squid:latest -v | grep -i version
echo -n '3.5.27: ' && docker run --rm ${USER}/squid:3.5.27 -v | grep -i version
echo -n '4.0.21: ' && docker run --rm ${USER}/squid:4.0.21 -v | grep -i version
# EOF
