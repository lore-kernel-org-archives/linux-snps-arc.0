Return-Path: <SRS0=KE/D=FF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A11C64E7A
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 10:29:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F6102084C
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 10:29:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cV2+dv9a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUadOkON"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F6102084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gzMA9oK3xKi2Rs8bBkz1RjAu38EYMmqQt6Q0TPkpbuA=; b=cV2+dv9af8jyGv9CZfLFjpuQI
	DfVSAkMS0OaL6yuKu6EMOhWKgTg+jKhByTFpJ4Ti28qHH5VgOA2fofsCxxs/xIK9IBS1YKUbZtXy0
	3h7UFPvPCtXL0PolgB5MDIQgSiLFjJBmh0EIG1j3p0q0CiYJIpNuiPRG9/9pZhCCrQc4ZpLBp+VbS
	fn6/STeIUub3lU/Gjkku/qw14I3PkG+DiVp9u+vAvjlLkeaGBDoogt2mbUKdXw5ttdlXJg8RGsjL9
	z/JI0BPiRIGmNN4QkDaQKzddMQ8xfkdHmscsZ8HuEvAS6610yMB8uGT4BExgmqrPjSVhm6y+yRyYL
	wpG+vaeXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk2uQ-0006ZI-Ui; Tue, 01 Dec 2020 10:29:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk2uJ-0006VJ-GA; Tue, 01 Dec 2020 10:29:16 +0000
Received: from kernel.org (unknown [87.71.85.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 194602080A;
 Tue,  1 Dec 2020 10:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606818554;
 bh=Ws6dR/OG3AOU58f5wZaP5SOr5YFu6occCl/egAoMHKA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SUadOkONZm3yl4vUgx4ptuiDtfj+cJiQNuA5oHKmXZxvGWy0g8QkVsFClkrV67HlY
 vRhIZcBu2BlL3N3eBSHPLP47jfJ1d1NpKcGqF/7pM3biCdU1ahEBnZj+ZAulT6sx2x
 QaOaVP9R5iZI2YknaXdnDtAwtqchPwXSObLcS3RA=
Date: Tue, 1 Dec 2020 12:29:01 +0200
From: Mike Rapoport <rppt@kernel.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v2 00/13] arch, mm: deprecate DISCONTIGMEM
Message-ID: <20201201102901.GF557259@kernel.org>
References: <20201101170454.9567-1-rppt@kernel.org>
 <43c53597-6267-bdc2-a975-0aab5daa0d37@physik.fu-berlin.de>
 <20201117062316.GB370813@kernel.org>
 <a7d01146-77f9-d363-af99-af3aee3789b4@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7d01146-77f9-d363-af99-af3aee3789b4@physik.fu-berlin.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_052915_671572_F468CCB4 
X-CRM114-Status: GOOD (  19.45  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-m68k@lists.linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 Michael Schmitz <schmitzmic@gmail.com>, Tony Luck <tony.luck@intel.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Adrian,

On Tue, Dec 01, 2020 at 10:10:56AM +0100, John Paul Adrian Glaubitz wrote:
> Hi Mike!
> 
> On 11/17/20 7:23 AM, Mike Rapoport wrote:
> >> Apologies for the late reply. Is this still relevant for testing?
> >>
> >> I have already successfully tested v1 of the patch set, shall I test v2?
> > 
> > There were minor differences only for m68k between the versions. I've
> > verified them on ARAnyM but if you have a real machine a run there would
> > be nice.
> 
> I have just built a fresh kernel from the tip of Linus' tree and it boots
> fine on my RX-2600:
> 
> root@glendronach:~# uname -a
> Linux glendronach 5.10.0-rc6 #6 SMP Tue Dec 1 04:52:49 CET 2020 ia64 GNU/Linux
> root@glendronach:~#
> 
> No issues observed so far. Looking at the git log, it seems these changes haven't
> been merged for 5.10 yet. I assume they will be coming with 5.11?

These changes are in linux-mm tree (https://www.ozlabs.org/~akpm/mmotm/
with a mirror at https://github.com/hnaz/linux-mm)

I beleive they will be coming in 5.11.

> Adrian
> 
> -- 
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer - glaubitz@debian.org
> `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
