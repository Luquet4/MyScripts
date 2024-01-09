#!/bin/bash
knock 192.168.30.3 12345:tcp 51234:tcp 45123:tcp 34512:tcp
sleep 3
ssh –p 42129 reisfa@192.168.30.3
