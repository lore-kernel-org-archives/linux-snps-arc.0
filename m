From: joseph@codesourcery.com (Joseph Myers)
Date: Thu, 20 Dec 2018 23:24:33 +0000
Subject: [PATCH 13/21] ARC: Build Infrastructure
In-Reply-To: <98eef4d3-93a2-0ad5-fef1-912cede85650@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-14-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182340110.30183@digraph.polyomino.org.uk>
 <23aece37-8497-8b48-dadb-3e73667ff3e4@synopsys.com>
 <alpine.DEB.2.21.1812192214410.10617@digraph.polyomino.org.uk>
 <98eef4d3-93a2-0ad5-fef1-912cede85650@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812202323290.24773@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Thu, 20 Dec 2018, Vineet Gupta wrote:

> On 12/19/18 2:17 PM, Joseph Myers wrote:
> > I should note a separate issue to consider: that of *static* PIE support.  
> > That doesn't need to be working, but if it's not working,
> 
> Aren't there directed test cases for that already ?
> 
> PASS: elf/tst-tls1-static
> PASS: elf/tst-tls1-static-non-pie
> FAIL: gmon/tst-gmon-pie-gprof

The key point on the PortStatus page is "If linker can correctly generate 
static PIE, glibc test results should be identical with and without 
--enable-static-pie.".  You need to test a build configured with 
--enable-static-pie to see if this is fully working.

-- 
Joseph S. Myers
joseph at codesourcery.com
