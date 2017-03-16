From: tglx@linutronix.de (Thomas Gleixner)
Date: Thu, 16 Mar 2017 18:42:39 +0100 (CET)
Subject: [RFC PATCH 00/13] Introduce first class virtual address spaces
In-Reply-To: <20170316172909.ux4u7dbspwlynsce@arch-dev>
References: <20170316172909.ux4u7dbspwlynsce@arch-dev>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1703161841220.3586@nanos>
To: linux-snps-arc@lists.infradead.org

On Thu, 16 Mar 2017, Till Smejkal wrote:
> On Thu, 16 Mar 2017, Thomas Gleixner wrote:
> > Why do we need yet another mechanism to represent something which looks
> > like a file instead of simply using existing mechanisms and extend them?
> 
> You are right. I also recognized during the discussion with Andy, Chris,
> Matthew, Luck, Rich and the others that there are already other
> techniques in the Linux kernel that can achieve the same functionality
> when combined. As I said also to the others, I will drop the VAS segments
> for future versions. The first class virtual address space feature was
> the more interesting part of the patchset anyways.

While you are at it, could you please drop this 'first class' marketing as
well? It has zero technical value, really.

Thanks,

	tglx
