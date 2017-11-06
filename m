From: joseph@codesourcery.com (Joseph Myers)
Date: Mon, 6 Nov 2017 22:26:52 +0000
Subject: [RFC 4/6] ARC: Initial port to glibc
In-Reply-To: <71bc62c1-11bd-d1a7-c78c-5cc2d166f682@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1706271147470.17677@digraph.polyomino.org.uk>
 <71bc62c1-11bd-d1a7-c78c-5cc2d166f682@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1711062225400.30112@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Mon, 6 Nov 2017, Vineet Gupta wrote:

> Revisiting glibc upstreaming for ARC. I was told that the lawyers did their
> "foo". Do you have the copyright assignment from Synopsys already - or do you
> want me to send it to you (privately perhaps)

I can confirm the assignment is listed in copyright.list.

> glibc has obviously moved on since our initial submission. What branch / tag
> shall I rebase off of. This also has a bearing on minimum symbol version,
> which per the last comment on the list was changed to 2.26 across the port !

New port submissions should be based on master, and use the next release's 
version as minimum symbol version (so GLIBC_2.27 minimum symbol version at 
present).

-- 
Joseph S. Myers
joseph at codesourcery.com
