From: mpe@ellerman.id.au (Michael Ellerman)
Date: Tue, 20 Feb 2018 17:19:31 +1100
Subject: [PATCH] fix double ;;s in code
In-Reply-To: <20180219154135.GV22199@phenom.ffwll.local>
References: <20180217211955.GE9640@amd>
 <187435d4-5017-edb5-9b6a-b433a148bfcc@c-s.fr>
 <20180219154135.GV22199@phenom.ffwll.local>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87vaesrxn0.fsf@concordia.ellerman.id.au>
To: linux-snps-arc@lists.infradead.org

Daniel Vetter <daniel at ffwll.ch> writes:
> On Sun, Feb 18, 2018@11:00:56AM +0100, Christophe LEROY wrote:
>> Le 17/02/2018 ? 22:19, Pavel Machek a ?crit?:
>> > 
>> > Fix double ;;'s in code.
>> > 
>> > Signed-off-by: Pavel Machek <pavel at ucw.cz>
>> 
>> A summary of the files modified on top of the patch would help understand
>> the impact.
>> 
>> A maybe there should be one patch by area, eg one for each arch specific
>> modif and one for drivers/ and one for block/ ?
>
> Yeah, pls split this into one patch per area, with a suitable patch
> subject prefix. Look at git log of each file to get a feeling for what's
> the standard in each area.

This part is actually pretty annoying.

I hacked up a script (below) which seems to do a reasonable job in most
cases.

For this patch it gives:

  $ for f in $(git ls-files -m); do ./guess-prefix.py $f; done
  ARC: 
  ARC: 
  ARM: 
  arm64: ptrace: 
  KVM: PPC: 
  powerpc/powernv:
  x86/efi:
  block/sed-opal:
  clocksource: mips-gic: 
  clocksource/drivers/sun5i:
  drm/amd/display:
  drm/amd/powerplay:
  drm/msm/mdp5:
  drm: 
  iommu/vt-d:
  md: 
  soc: imx: gpc: 

I think those are correct except for:
 - "drm:" for "drivers/gpu/drm/scheduler" which has only a single commit.
 - "md:" for "drivers/md/raid1.c" which is tricked by inconsistent
    usage of "md: raid1:" and "md/raid1:".

But that seems like a reasonable hit rate.

Another approach would be to have a file that defines for each subsystem
what the preferred style is, but that is likely to be a PITA to
maintain.

cheers


#!/usr/bin/python3

import sys
import re
from subprocess import check_output
from collections import Counter

if len(sys.argv) != 2:
    print('Usage: %s <path>' % sys.argv[0], file=sys.stderr)
    sys.exit(1)

fname = sys.argv[1]

cmd = ['git', 'log', '--format=%s', '-n', '100', fname]
output = check_output(cmd).decode('utf-8')

ignore = ['License', 'Merge']

# Ordered list of patterns
patterns = [
    # Common style "foo/bar/baz: Fix the foo"
    re.compile('^([\w\-_]+: )+'),
    # Less common "foo bar baz: Fix the foo"
    re.compile('^([\w\-_]+:? )+: ')
]

words = []
for line in output.splitlines():
    prefix = line.split()[0]
    for patt in patterns:
        match = patt.search(line)
        if match:
            prefix = match.group(0)
            break

    if prefix in ignore:
        continue

    words.append(prefix)

# Warn if we didn't find many examples
if len(words) < 5:
    print("Warning: only found %d previous commits to guess from for" % len(words),
          fname, file=sys.stderr)

counts = Counter(words)
print(counts.most_common(1)[0][0])
