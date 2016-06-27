From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 27 Jun 2016 09:27:25 +0000
Subject: Patches for ARC
In-Reply-To: <20160613203842.GF2584@waldemar-brodkorb.de>
References: <1465820208.4130.11.camel@synopsys.com>
 <20160613203842.GF2584@waldemar-brodkorb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1467019584.3628.40.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Waldemar,

On Mon, 2016-06-13@22:38 +0200, Waldemar Brodkorb wrote:
> Hi Alexey,
> Alexey Brodkin wrote,
> 
> > 
> > Hi Waldemar,
> > 
> > Just saw that new change for ARC ("arc: use generic lowlevellock",
> > http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=1b49dc96d103e0151fee290d55cea55aa12c906d).
> > 
> > Even though this is very nice to see fixes and improvements done by people
> > outside Synopsys IMHO it still makes sense to add SNPS people in the loop so
> > we may review submitted patches.
> You are right, I first thought I need to add you, then I thought you
> are reading the low traffic list anyway.?
> Sorry for the trouble.
> ?
> > 
> > So could you please first get an Ack from either Vineet (in Cc) or me before
> > committing stuff for ARC? Alternatively just Cc?linux-snps-arc at lists.infradead.org.
> I will do in the future. Do you thing following patch would be okay
> to commit to make changes to architecture specific parts
> more formal?
> ?
> > 
> > Again I'm very happy with uClibc-ng and appreciate a lot all your efforts
> > and to make uClibc-ng more robust let's review stuff together.
> > 
> > Also it was hard for me to find a relevant patch on the mailing list
> > because I was expecting patch to be sent via git "send-email" (which I think
> > should be a standard way for patch submissions in uClibc). Only going through a relevant
> > thread for ARM I found a message with attached files.
> Is the commit okay or do I need to revert it?

Sorry for late reply.

Yep this commit is fine so no need to do anything here.

-Alexey
