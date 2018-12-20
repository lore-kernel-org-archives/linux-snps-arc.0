From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 20 Dec 2018 15:21:49 -0800
Subject: [PATCH 13/21] ARC: Build Infrastructure
In-Reply-To: <alpine.DEB.2.21.1812192214410.10617@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-14-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182340110.30183@digraph.polyomino.org.uk>
 <23aece37-8497-8b48-dadb-3e73667ff3e4@synopsys.com>
 <alpine.DEB.2.21.1812192214410.10617@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <98eef4d3-93a2-0ad5-fef1-912cede85650@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/19/18 2:17 PM, Joseph Myers wrote:
> I should note a separate issue to consider: that of *static* PIE support.  
> That doesn't need to be working, but if it's not working,

Aren't there directed test cases for that already ?

PASS: elf/tst-tls1-static
PASS: elf/tst-tls1-static-non-pie
FAIL: gmon/tst-gmon-pie-gprof

I vaguely remember binutils folks fixing some pie issues when above became PASS

> or if you don't 
> know whether it's working, when the port goes in you need to update the 
> list at <https://sourceware.org/glibc/wiki/PortStatus> accordingly.  (Port 
> maintainers need to make sure 
> <https://sourceware.org/glibc/wiki/PortStatus> and 
> <https://sourceware.org/glibc/wiki/ABIList> are up to date for their 
> ports, as well as posting test results on the per-release wiki page during 
> each release cycle's freeze period.)

Will do when we get there :-)

Thx,
-Vineet
