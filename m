From: maxime.ripard@free-electrons.com (maxime.ripard@free-electrons.com)
Date: Mon, 14 Dec 2015 09:43:24 +0100
Subject: percpu irq APIs and perf
In-Reply-To: <566ABF86.9030308@synopsys.com>
References: <C2D7FE5348E1B147BCA15975FBA23075F44D580B@IN01WEMBXA.internal.synopsys.com>
 <56694C0E.5050707@arm.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44D59B9@IN01WEMBXA.internal.synopsys.com>
 <566AB24C.3040407@arm.com> <566ABF86.9030308@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20151214084324.GE19456@lukather>
To: linux-snps-arc@lists.infradead.org

Hi,

On Fri, Dec 11, 2015@05:50:22PM +0530, Vineet Gupta wrote:
> >> (2) It seems that disabling autoen by default for percpu irq makes sense as
> >> evident from drivers/net/ethernet/marvell/mvneta.c where users want to control
> >> this. However the comment there is misleading
> >>
> >>     /* Even though the documentation says that request_percpu_irq
> >>      * doesn't enable the interrupts automatically, it actually
> >>      * does so on the local CPU.
> >>      *
> >>      * Make sure it's disabled.
> >>      */
> >>
> >> Either sme core code is clearing NOAUTOEN or calling enable_precpu_irq() making
> >> request_percpu_irq() enable it.
> > 
> > If that's the case, this is a bug. Nobody should enable that interrupt
> > until the driver has chosen to do so.
> 
> Perhaps Maxim can shed more light as this seems to be his comment.

I don't really have the full context here, but we did this in order to
allow RX queue interrupts to be enabled on a particular CPU.

The IP was supposed to do that by itself, but we hadn't figure that
out at the time. So what we ended up doing is disabling the interrupts
by default and then enable it only on the CPU meant to receive the
queue interrupts.

What we found out doing so was that the per-cpu interrupts were
enabled on the cpu calling request_percpu_irq, and so that's why it
ended up with that comment.

I also fixed the documentation accordingly in a1b7febd725a.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20151214/540099ea/attachment.sig>
