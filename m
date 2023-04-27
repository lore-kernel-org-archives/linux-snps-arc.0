Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A26AC77B61
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Apr 2023 17:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dT5KaCeRlib0T8HIRcoVilAzm7XytjIfa/k1Qv/g9B0=; b=q0AbSGUpkuwpjD
	JIVt/twca2xXOuMZ8A9NckC6F5rD/qlrq1VpLl9osYLAGRMRt5Ly4T12KQRl7Mwz6teilmR9HfptY
	X0/Hi4GDQY/6CNT7u+qkIZdeaFKXMLbC4jNP4Oj0if1RWTV4bwflLfy+fFCFyH8k1gI+q0m/M/Ovv
	TyzQeZ4yKS6h1BoY2BVQ7XkPhtoVeg9fmvYxcP09qIupRdXmvNGBezZoIps21Db4EmC3Ezagn/LDj
	n9ZtcBEJndraNJsNApfwsjgmMCRWPUI6mOWfCQa4ymI/HyssfbkoXr1+7mn2/6PM1G3ar1fHrn7l5
	VNTEkwr3jmqmaesBd1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps5FX-0075Kj-0Z;
	Thu, 27 Apr 2023 17:17:43 +0000
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:404::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps5FS-0075H4-0C
	for linux-snps-arc@lists.infradead.org;
	Thu, 27 Apr 2023 17:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=3aPWmuilP5wLRilofoqbOrLGxKBwB7pAtJ4SXkaLvoc=;
	b=TLJMIi0RX8F2D4MECviwMXYvEcVb0lEsEy3+u8aUlSP8SU8rlCRGlNNmsB/nVOCzgK5pBrkqJQZ1F
	 4Pk0P0hLFN1/gQl0wOoX80yo5LMFFkY8AFk8tIjenbcNtBTjLcrXTVOu35BU0ZgXdWnnSf7qi6nZ3E
	 orNHCnRqwI7LiLkgzVpEQaOMbxTZLeop5dV4q915EpZK5kidlhmu8EBhfMffenaiZSY9k7inpdXkTU
	 Jqtqf/GAdMoncZ0gbyd6bbDaxV/c7d0xakYFi8MhdcA4DCSizJdUq7VgNEnQ2ErW0+f+L1lpNilWl3
	 /TH/k1Te5r34DMQFVMUEym1QgkeLrjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=3aPWmuilP5wLRilofoqbOrLGxKBwB7pAtJ4SXkaLvoc=;
	b=G5LZPAqKFgpnZqaJfT/ouJ07IZWuTH9E70Iw4lwAnH6U6PTleuFBBWfBI+H0sNsJGesQJZYrDGZOe
	 rwUJGIwDg==
X-HalOne-ID: 62b9268b-e51f-11ed-ad1f-231b2edd0ed2
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay5 (Halon) with ESMTPSA
	id 62b9268b-e51f-11ed-ad1f-231b2edd0ed2;
	Thu, 27 Apr 2023 17:17:31 +0000 (UTC)
Date: Thu, 27 Apr 2023 19:17:29 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, geert@linux-m68k.org, javierm@redhat.com,
	daniel@ffwll.ch, vgupta@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, davem@davemloft.net,
	James.Bottomley@hansenpartnership.com, arnd@arndb.de,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org
Subject: Re: [PATCH 0/5] fbdev: Move framebuffer I/O helpers to <asm/fb.h>
Message-ID: <20230427171729.GA3899979@ravnborg.org>
References: <20230426130420.19942-1-tzimmermann@suse.de>
 <20230426192110.GA3791243@ravnborg.org>
 <3e33ab1d-b478-fdf5-6fbe-6580000182d1@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e33ab1d-b478-fdf5-6fbe-6580000182d1@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_101739_608749_38EB90FC 
X-CRM114-Status: GOOD (  27.34  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Thomas,

On Thu, Apr 27, 2023 at 09:22:47AM +0200, Thomas Zimmermann wrote:
> Hi Sam
> 
> Am 26.04.23 um 21:21 schrieb Sam Ravnborg:
> > Hi Thomas.
> > 
> > On Wed, Apr 26, 2023 at 03:04:15PM +0200, Thomas Zimmermann wrote:
> > > Fbdev provides helpers for framebuffer I/O, such as fb_readl(),
> > > fb_writel() or fb_memcpy_to_fb(). The implementation of each helper
> > > depends on the architecture. It's still all located in fbdev's main
> > > header file <linux/fb.h>. Move all of it into each archtecture's
> > > <asm/fb.h>, with shared code in <asm-generic/fb.h>.
> > 
> > For once I think this cleanup is moving things in the wrong direction.
> > 
> > The fb_* helpers predates the generic io.h support and try to
> > add a generic layer for read read / write operations.
> > 
> > The right fix would be to migrate fb_* to use the io helpers
> > we have today - so we use the existing way to handle the architecture
> > specific details.
> 
> I looked through the existing versions of the fb_() I/O helpers. They can
> apparently be implemented with the regular helpers of similar names.
> 
> I'm not sure, but even Sparc looks compatible. At least these sbus_
> functions seem to be equivalent to the __raw_() I/O helpers of similar
> names.

> Do you still have that Sparc emulator?
I used qemu the last time I played with sparc and saved the instructions
somewhere how to redo it - but that would use to bohcs driver only I think.
I have saprc machines, but none of these are easy to get operational.
We can always ask on sparclinux to get some testing feedback.

> 
> > 
> >  From a quick look there seems to be some challenges but the current
> > helpers that re-do part of io.h is not the way forward and hiding them
> > in arch/include/asm/fb.h seems counter productive.
> 
> Which challenges did you see?
sparc was the main thing - but maybe I did not look close enough.
And then I tried to map the macros to some of the more highlevel ones
from io.h, but as Arnd says the __raw* is the way to go here.

	Sam

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
