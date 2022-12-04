pactl list sinks | grep "Sink #" | grep -E -o '[0-9.]+' | xargs -i pactl set-sink-volume {} -10%
