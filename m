From: tglx@linutronix.de (Thomas Gleixner)
Date: Thu, 16 Mar 2017 09:21:38 +0100 (CET)
Subject: [RFC PATCH 00/13] Introduce first class virtual address spaces
In-Reply-To: <20170315220234.mooiyrzqdsglo4lp@arch-dev>
References: <20170315220234.mooiyrzqdsglo4lp@arch-dev>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1703160919170.3586@nanos>
To: linux-snps-arc@lists.infradead.org

On Wed, 15 Mar 2017, Till Smejkal wrote:
> On Wed, 15 Mar 2017, Andy Lutomirski wrote:

> > > VAS segments on the other side would provide a functionality to
> > > achieve the same without the need of any mounted filesystem. However,
> > > I agree, that this is just a small advantage compared to what can
> > > already be achieved with the existing functionality provided by the
> > > Linux kernel.
> > 
> > I see this "small advantage" as "resource leak and security problem".
> 
> I don't agree here. VAS segments are basically in-memory files that are
> handled by the kernel directly without using a file system. Hence, if an

Why do we need yet another mechanism to represent something which looks
like a file instead of simply using existing mechanisms and extend them?

Thanks,

	tglx
