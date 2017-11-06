From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 6 Nov 2017 14:51:56 -0800
Subject: [RFC 0/6] glibc port to ARC architecture
In-Reply-To: <alpine.DEB.2.20.1706271157100.17677@digraph.polyomino.org.uk>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <357a6f84-3f71-d3b7-9c19-4f0390e5db8d@redhat.com>
 <alpine.DEB.2.20.1706271157100.17677@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5a247430-83e7-8a75-3935-6307233ffbd1@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/27/2017 05:00 AM, Joseph Myers wrote:
> On Tue, 27 Jun 2017, Florian Weimer wrote:
> 
>> On 06/27/2017 10:00 AM, Vineet Gupta wrote:
>>> This is a Request for comments for glibc port to ARC architecture.
>>> http://www.synopsys.com/IP/ProcessorIP/ARCProcessors/Pages/default.aspx
>>>
>>> The Linux kernel, uClibc, buildroot have been upstream for quite some time.
>>
>> Is it possible to build the new port with scripts/build-many-glibcs.py?
> 
> More specifically:
> 
> Any new port should have support added to build-many-glibcs.py for all
> ABIs supported by the port (e.g. both endiannesses, if you support both BE
> and LE, and any other ABI variants).

I added the trivial bits to build-many-glibcs.py for supporting ARC, but it seems 
there are some roadblocks.

1. There are still some in-flight patches for gcc/binutils upstreaming. The latest 
working versions are hoisted on on SNPS github portal, but that won't fly I guess. 
Anyhow for now, the upstream versions are likely to suffice for say building part.

2. The immediate (and embarrassing) issue is trying to figure out how to make the 
build-many-glibcs.py script work. A wiki page for new ports would have helped a lot.

   - How do I call it the first time, with my existing version of glibc.
     The checkout process, gets upstream glibc and tries to build that instead.

   - So I created a src directory manually, will all other tools and glibc being a
     symlink to my existing glibc tree and calling it as follows

$ test-glibc/src/glibc>./scripts/build-many-glibcs.py <abs-path>/test-glibc 
compilers  arc-linux-gnu

FAIL: compilers-arc-linux-gnu check-host-libraries
UNRESOLVED: compilers-arc-linux-gnu binutils rm
UNRESOLVED: compilers-arc-linux-gnu binutils mkdir
UNRESOLVED: compilers-arc-linux-gnu binutils configure
UNRESOLVED: compilers-arc-linux-gnu binutils build
...

I'm missing obvious/simple stuff, but this is a new env for me.

-Vineet
