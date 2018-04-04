From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 4 Apr 2018 15:55:02 +0000
Subject: tst-atomic
In-Reply-To: <20180313195515.GK2114@waldemar-brodkorb.de>
References: <1520952717.4993.18.camel@synopsys.com>
 <20180313195515.GK2114@waldemar-brodkorb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1522857302.4851.53.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Waldemar,

On Tue, 2018-03-13@20:55 +0100, Waldemar Brodkorb wrote:
> Hi Alexey,
> Alexey Brodkin wrote,
> 
> > Hi Waldemar,
> > 
> > I see in commit e65912f8b2a6 ("rework most tests to work as standalone package")
> > "tst-atomic" and "tst-atomic-long" were marked as disabled for all architectures
> > as opposed to previously (in times of test-suite being a part of uClibc) disabled
> > only for selected arches (IA64, MIPS and SPARC).
> > 
> > The only guess I have it was done due to inability to refer not-exported "atomic.h".
> > Is that correct? But anyways I'm looking at a possibility to revive those as they
> > might be of use especially in case of emulation of atomics.
> > 
> > Any thoughts on how that could be done?
> 
> Should we export atomic.h again?
> The header is removed since
> 536a0e3a05a0c7d9a4d741d9401c220900cf1e04.

Probably not as this will open again a can with worms.
Fortunately I was able to get my problem understood and almost solved,
I guess you're on Cc list of that discussion here:
http://lists.infradead.org/pipermail/linux-snps-arc/2018-March/003583.html

But then why don't we get rid of ./test/silly/tst-atomic*.c at all?

-Alexey
