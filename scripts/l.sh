#!/bin/bash
python3 -m venv meow
source meow/bin/activate
wget https://github.com/samarochka/meow/releases/latest/download/meow-universal-py3-none-any.whl --no-verbose
pip3 install meow-universal-py3-none-any.whl
echo Success! Application is available by running $(pwd)/meow/bin/meow
