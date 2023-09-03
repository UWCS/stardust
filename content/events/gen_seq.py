"""
Usage:

python gen_seq.py fng/2023-09-29-fng-t1w0.md 5
"""

import re
import shutil
import sys
from datetime import date, timedelta
from pathlib import Path

filename = sys.argv[1]
path = Path(filename)
rgx = r"(\d{4}-\d\d-\d\d)-(.+)-t(\d+)w(\d+).md$"
base_date, base, term, week = re.search(rgx, path.name).groups()
base_date = date.fromisoformat(base_date)
week = int(week)

count = int(sys.argv[2])

for i in range(1, count):
    d = base_date + timedelta(weeks=i)
    w = int(week) + i
    shutil.copy(filename, path.parent / f"{d}-{base}-t{term}w{w}.md")
