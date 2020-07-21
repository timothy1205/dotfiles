#!/usr/bin/env python

import sys
import os.path
import requests
from html.parser import HTMLParser
import time
from datetime import datetime

transmit_bytes, receive_bytes, last_time = -1, -1, -1

if os.path.isfile('./data.txt'):
    data_file = open('data.txt', 'r')
    split = data_file.read().split("\n")
    if len(split) > 1:
        transmit_bytes, receive_bytes, last_time = int(split[0]), int(split[1]), float(split[2])
    data_file.close()

lookFor = ['Transmit Bytes', 'Receive Bytes']

class NetStatParser(HTMLParser):
    writable_file = None
    use_next_data = False
    count = 0
    current_time = -1
    speeds = []

    def __init__(self):
        super().__init__()

        self.current_time = self.epoch()
        self.writable_file = open('data.txt', 'w')

    def handle_data(self, data):
        if self.use_next_data:
            if data.strip():
                if transmit_bytes > -1:
                    self.calculate(data)
                else:
                    print(0)
                
                self.writable_file.write(data + '\n')
                self.use_next_data = False
                self.count += 1
        else:
            self.use_next_data = data in lookFor

    def calculate(self, new):
        new = int(new)
        old = int(transmit_bytes if self.count == 0 else receive_bytes)
        bps = (new - old) / (self.current_time - last_time)
        self.speeds.append(round(bps / 1048576, 2))

    def epoch(self):
        return time.mktime(datetime.now().timetuple())

    def close(self):
        self.writable_file.write(str(self.current_time))
        self.writable_file.close()


html = requests.get('http://192.168.1.254/cgi-bin/broadbandstatistics.ha')

parser = NetStatParser()
parser.feed(html.text)
parser.close()

print(f"D:{parser.speeds[1]} U:{parser.speeds[0]}")
