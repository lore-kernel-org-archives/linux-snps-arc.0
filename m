From: joseph@codesourcery.com (Joseph Myers)
Date: Wed, 19 Dec 2018 22:17:00 +0000
Subject: [PATCH 13/21] ARC: Build Infrastructure
In-Reply-To: <23aece37-8497-8b48-dadb-3e73667ff3e4@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-14-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182340110.30183@digraph.polyomino.org.uk>
 <23aece37-8497-8b48-dadb-3e73667ff3e4@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812192214410.10617@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Wed, 19 Dec 2018, Vineet Gupta wrote:

> Indeed with current glibc port, we do build/test/run a bunch of packages 
> relying on PIE (dumpcap, openssh come to mind) successfully. So yes PIE 
> should work in general for ARC now. FWIW this could also explain the 
> following current results.

I should note a separate issue to consider: that of *static* PIE support.  
That doesn't need to be working, but if it's not working, or if you don't 
know whether it's working, when the port goes in you need to update the 
list at <https://sourceware.org/glibc/wiki/PortStatus> accordingly.  (Port 
maintainers need to make sure 
<https://sourceware.org/glibc/wiki/PortStatus> and 
<https://sourceware.org/glibc/wiki/ABIList> are up to date for their 
ports, as well as posting test results on the per-release wiki page during 
each release cycle's freeze period.)

-- 
Joseph S. Myers
joseph at codesourcery.com
