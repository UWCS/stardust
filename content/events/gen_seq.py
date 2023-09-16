"""
Usage:

python gen_seq.py <template.md> <term #> <week start> <week end>
"""

import re
import shutil
import sys
import os
from datetime import date, timedelta
from pathlib import Path

src = Path(sys.argv[1])
term_no, start_week, end_week = map(int, sys.argv[2:5])

for i in range(start_week, end_week+1):
    dest = Path(f"t{term_no}/w{i}/{src.name}")
    os.makedirs(dest.parent)
    shutil.copy(src, dest)
