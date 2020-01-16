Return-Path: <SRS0=rUT0=3F=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9282C33CB7
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jan 2020 16:52:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 695B52464B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jan 2020 16:52:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BoEJa5at"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 695B52464B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YtjBZuUKUZoOUUxYDnfVdhzQ4fSHu8fb8CMgggbMo1A=; b=BoEJa5atymtCF+
	qwA9pJNjNIKrdg4PGdN8NFc3ClwC1eVGBSXJPGoRWex20oJmncywyW/2u6g1umnI9zxWeAYitwmMF
	o1ZUlVK2wnQzshhNKE91swFcR4cTG0fsjGW7xs0MoE27C955o00BF05mJJKiS1HrcA/wIez2jKAu8
	I4RveUAkm1UDwvvify9/abkfGi7PuqzVXVPjJ50cTxfOe4E3kOkhvIZCBnt4dZ1rvfjWRDI71EiOU
	L+KZ6bprYuo0Q01ZKiEl3BlSJaYjgajmt25cGMtddSxVuFOaxBhbapoAiGNSRKNGAGMRL3WUFpzLc
	ZQAuZc+HsoA4XmIi3fUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is8Nx-0007xJ-7B; Thu, 16 Jan 2020 16:52:45 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8Nl-0007kw-OU
 for linux-snps-arc@lists.infradead.org; Thu, 16 Jan 2020 16:52:38 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 76C5A72CCEF;
 Thu, 16 Jan 2020 19:52:30 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 6005D7CCE30; Thu, 16 Jan 2020 19:52:30 +0300 (MSK)
Date: Thu, 16 Jan 2020 19:52:30 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: strace breaks with to be released glibc 2.31
Message-ID: <20200116165229.GA6417@altlinux.org>
References: <a3f63e62-e616-5fee-1f31-a09eb25406ef@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3f63e62-e616-5fee-1f31-a09eb25406ef@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_085234_045008_EE449388 
X-CRM114-Status: UNSURE (   6.11  )
X-CRM114-Notice: Please train this message.
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
Cc: arcml <linux-snps-arc@lists.infradead.org>, strace-devel@lists.strace.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Jan 15, 2020 at 08:10:38PM +0000, Vineet Gupta wrote:
> Hi,
> 
> I've been testing an in-works glibc port for ARC and with 2.31 there's a glibc
> change which seems to break strace.
> 
> Commit d1e411e5c786ce3 "Add PTRACE_GET_SYSCALL_INFO from Linux 5.3 to sys/ptrace.h."
> 
> This now defines PTRACE_GET_SYSCALL_INFO but defines struct __ptrace_syscall_info
> (not the non underscored ver) causing strace to trip.

You must've got a relatively rare environment with glibc-2.31 and Linux
kernel headers < 5.3.  I'm testing a fix.  Thanks,


-- 
ldv

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
