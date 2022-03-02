Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BCAC433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Mar 2022 11:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/K4ROKXnjaT2EQcJf/3wLQDK/yfCJDbTOymgtZjuig0=; b=kcA4ivCzUNqOb2
	QkPWeiINJvPdQ6oKGbSi5euUWtHNyMeSZTkiDlvPhnhoj6KsCrvmV4PgLhaVIjb2DZAFjkEohqn7d
	7lv5GC1Jx4rCdZKuLutO2VfofsvtcAXpg5Im1Q/3SUKqQpf92qf/LK7sThs0FObQ8rve/k7tLnXTJ
	C2pO0Haax2SK8GmSuQ8BCBq3vLBkLaxgvsRFXnBNVc1MYkjvEqi8bUD5Od9bSXCoMaFX19o1eXxUv
	wzl8lDzPiMyx7UY1Pwtw9yFTBz4dVLmjmM1Ll/4Y8i2zV35Ql0rnWZNAI6+xXx92WE6OkIvaOWgro
	BzH+aUEZ91rG61WaHX2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPN17-002QaS-Iv; Wed, 02 Mar 2022 11:19:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPN13-002QYr-Fh; Wed, 02 Mar 2022 11:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I1/BTw8u15H3AVnQDepPulkDIkTQG/EDO8JslQ2y518=; b=yzUOmQTC9SehCgZYgd4h+Ey12C
 IF3SwMxqhKSw9mftTnudCgM/6vhgVjqN1K54lqRScHZdWomhMSw8gc4Q17z82/t4ePZPTadPDNBW0
 RAYoi7RTG5lEPYnuj/W83EiMnjCPrblb+04/X34ls5AXk4/1qSt0tzJPYiQCOWZ8wtXGi6o/0W54C
 JYouMTieLlNBty6aTd82+iHFYVBl998jCqSMezXTJKHViIkOZV4L90kAOBr7Bjp+j1Cc20Fo3g2xF
 ZHXM5LboaCYqutYgpLpdk+j1UVvj2hjc2fYOc6snFpF3IOhlr7vydYbVzzsl941esiWGhbWsi5Amp
 qfJLh3Qg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57592)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nPN0v-0002K5-5r; Wed, 02 Mar 2022 11:19:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nPN0s-00085f-7p; Wed, 02 Mar 2022 11:19:22 +0000
Date: Wed, 2 Mar 2022 11:19:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH V3 09/30] arm/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Message-ID: <Yh9SuiayqcDdIB3B@shell.armlinux.org.uk>
References: <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
 <542fa048-131e-240b-cc3a-fd4fff7ce4ba@arm.com>
 <Yh1pYAOiskEQes3p@shell.armlinux.org.uk>
 <dc3c95a4-de06-9889-ce1e-f660fc9fbb95@csgroup.eu>
 <c3b60de0-38cd-160a-aa15-831349e07e23@arm.com>
 <52866c88-59f9-2d1c-6f5a-5afcaf23f2bb@csgroup.eu>
 <9caa90f5-c10d-75dd-b403-1388b7a3d296@arm.com>
 <CAMuHMdU11kaOzanhHZRH+mLTJzaz-i=PnKdK7NF9V-qx6kp8wg@mail.gmail.com>
 <b1eca2cd-36e6-3a9a-9fe7-70fc0caed7a9@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1eca2cd-36e6-3a9a-9fe7-70fc0caed7a9@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_031933_549882_8071F0C4 
X-CRM114-Status: GOOD (  11.48  )
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

On Wed, Mar 02, 2022 at 04:36:52PM +0530, Anshuman Khandual wrote:
> On 3/2/22 3:35 PM, Geert Uytterhoeven wrote:
> > I doubt the switch() variant would give better code on any platform.
> > 
> > What about using tables everywhere, using designated initializers
> > to improve readability?
> 
> Designated initializers ? Could you please be more specific. A table look
> up on arm platform would be something like this and arm_protection_map[]
> needs to be updated with user_pgprot like before.

There is *absolutely* nothing wrong with that. Updating it once during
boot is way more efficient than having to compute the value each time
vm_get_page_prot() gets called.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
