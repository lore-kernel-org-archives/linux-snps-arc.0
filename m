From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 21 Nov 2017 17:13:08 -0800
Subject: glibc: nptl/tst-cancel17 and librt issue
In-Reply-To: <87vai3fejj.fsf@linux-m68k.org>
References: <af0c5b39-eadb-e70e-2ad3-79754b04b324@synopsys.com>
 <CAKCAbMgdV8ieHvkhf6B0OkqsmpBYWSgZoi21rBeDRQB=yegMkQ@mail.gmail.com>
 <5d8601a2-5efa-4814-c965-d9187f9a2f5e@synopsys.com>
 <87vai3fejj.fsf@linux-m68k.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <339798fc-1293-2597-264a-c11200e29c1f@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/21/2017 02:33 PM, Andreas Schwab wrote:
> On Nov 21 2017, Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> 
>> the link cmd for build/nptl/librt.so.
> 
> There is no librt.so in nptl.

Right, but when you do a make check in build tree, it does try to build one, 
rather than reference the rt/librt.so

But indeed if I follow your suggested sequence below, I don't run into the issues

    make all ; make -k check

Thx for the tip
-Vineet
