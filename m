Return-Path: <SRS0=8BTh=LB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2466C4743F
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Jun 2021 09:47:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B156161130
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Jun 2021 09:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B156161130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PpTMqQ6wPU9bzgNrWcNx2NQ4UU9z3Lxj6CGzCHBhuuQ=; b=kaxAukeT0gUXne
	Av+JB5t67jV8bVygEfiJhJOT1xi4OjOv81MAUnoms09L6QpPY7DN4gnD4ELPw1MsQmXQtTkKrUPxx
	cj8YNbaQrOVDvMxZbeOC9hJALrCISb8i1Mr1yU8wp6WES/Ha6MMoMvjmo9n02hOMSenigpg57Vm4P
	Ity2nQ6fGrR4OrV356hRDGLEwAZ1N0MWhr5hM1pSxsJK9DL97fdBjbsyyJLi+k1acvILYKdLVV3vq
	gxRdofDvy9lrvja2PeevRRH4tyPVMIkGmCGd6pXiqA8tpwqoWJxd//jbRc9st4DXwubdVVwrzX/8w
	b3JFZjVr1orrGNtIqAnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqBqw-002hQP-Tq; Mon, 07 Jun 2021 09:47:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqBbf-002cMY-1L; Mon, 07 Jun 2021 09:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MlvkgxFcyawWgLbaD1anFAhejhA4mPswAd0WEOPLbd0=; b=cetr6/k8ZHIlURSNkBDEkxOd3
 puNo+HwooQUeJn9AaPBl4regJ9NkcXwohGBb5OPUoX7XTTODh5d6IsuhC8Hnw3taLmVn0F8+4hF1o
 ArioCmyKCJRUZ5c5W9Ct8Cw0Zpb4xNWdK87xHBWnc3daFNyrTg9aLL7A/E6TbbFPNgdTXMtoLpPh1
 VNTboFgYQtPgYxGziLgboqSm+C9rc0zETM+h5ZE5kg+2kGPOkoZAIe8MZfd5JZNTDNazJFXr/S6Gm
 YDi+dqX3d1L4b71QKMOqk7jvcXPp8QSgQdX3C28GtCjdiTWKtuBWWAYuFwAi7GnVSCXRZB8Zx7iVW
 ALDutps2w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44784)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lqBbS-0000Eu-Fv; Mon, 07 Jun 2021 10:31:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lqBbN-0005oE-UB; Mon, 07 Jun 2021 10:31:21 +0100
Date: Mon, 7 Jun 2021 10:31:21 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Mike Rapoport <rppt@kernel.org>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 00/15] init_mm: cleanup ARCH's text/data/brk setup code
Message-ID: <20210607093121.GC22278@shell.armlinux.org.uk>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
 <YL0+Jargm+y9aqx1@kernel.org>
 <481056ab-686e-9f42-3b8a-b31941f58af6@huawei.com>
 <006eb573-5a20-1ac7-6234-338d11346a08@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <006eb573-5a20-1ac7-6234-338d11346a08@csgroup.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_023139_154894_06700AF7 
X-CRM114-Status: GOOD (  11.27  )
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

On Mon, Jun 07, 2021 at 07:48:54AM +0200, Christophe Leroy wrote:
> Hi Kefeng,
> 
> What you could do is to define a __weak function that architectures can
> override and call that function from mm_init() as suggested by Mike,

The problem with weak functions is that they bloat the kernel. Each
time a weak function is overriden, it becomes dead unreachable code
within the kernel image.

At some point we're probabily going to have to enable -ffunction-sections
to (hopefully) allow the dead code to be discarded.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
