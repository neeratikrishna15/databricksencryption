#!/usr/bin/env python

import sys
import re

sensitive_patterns = [
    r"password\s*=\s*['\"].*?['\"]",
    r"api_key\s*=\s*['\"].*?['\"]",
    "J_F8Q~kDSlBCY-0Tqx2FrWfsoUD~NNCAy55mgbdJ"
]

for line in sys.stdin:
    for pattern in sensitive_patterns:
        line = re.sub(pattern, "REDACTED", line)
    sys.stdout.write(line)