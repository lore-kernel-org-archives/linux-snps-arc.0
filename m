Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95820C7EE29
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 May 2023 18:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jXp34ppAqewPKIy+grorX9zZ/KUu6oUJOWkFZerBHy0=; b=OrzSzIe0Y5J4VK
	XxB1wnCNN6JL22FW4pe0VPAYxZTAskGjXPTkZn3qcZmLKGNdEJ9Qmc8uBkh0aR+nBzLGJZZ5MxCqj
	BGNHgIJ2BmBL74dNiv7vwdlEO9qr90CvwTRRRnjAy7mEDjlYAyw/zKMKf6pyzFKl6m+xCCyTpG2jY
	z9sdEjaUZ2jj32aAi85AtVUUf7Fhnpwo3i68F17zheUbYg+9MaOTsx27crrsv89V4K+E4UttfVmlr
	fFGSH3TTIY2vaPcuiNc8B/+Qd7oEFMqBh8qAUtdu8GNjpt1zk7Nn0XYSTBLGPF+LjxooxWbHuwVkS
	3c953eau42YeuyyVu7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pudtU-008ZZG-08;
	Thu, 04 May 2023 18:41:32 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pudtR-008ZWf-1t
	for linux-snps-arc@lists.infradead.org;
	Thu, 04 May 2023 18:41:30 +0000
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 567092C8;
	Thu,  4 May 2023 18:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 567092C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1683225682; bh=M+B8SLm2PMpcta7Rti3FG8GJchHOrmHgx3npRi99b0I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D8F8e1r5FZCihfpZZlw2+z+byrsjbVr+sas/C2TEgJm3BqSuhVyHZ93EDR0L3qJTA
	 P6h8rPVfEpJKtEzLiApFxuSMAAeF243cOrEEci9zk8bbKSUZeuDt4eQESBOUNT7puk
	 mcBaITpCCjH0tMh5lfSNvPxn/gj3KJiHwmeEFFxbga4pQT7UvWVVdUyvN/N+R8CZk2
	 K1/gTctWIWUzf+eWgjq7fi02VApwtsOvabN3M+6TlCSXmtFPmlX6X7bBmQHH8eJPHx
	 DY5c4bbfCkBT3czlY9m3tBy1sNxrvfQgQwZGyHgBqvRGx6MV5VtVx1c0F6Z4bLwzOH
	 rHTIezs2tF/SQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-doc@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>, Vineet Gupta
 <vgupta@kernel.org>, Jonas Bonn <jonas@southpole.se>, Stefan Kristiansson
 <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich
 Felker <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND
 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Yanteng Si
 <siyanteng@loongson.cn>, Geert Uytterhoeven <geert@linux-m68k.org>, Max
 Filippov <jcmvbkbc@gmail.com>, "open list:SYNOPSYS ARC ARCHITECTURE"
 <linux-snps-arc@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:IA64 (Itanium) PLATFORM"
 <linux-ia64@vger.kernel.org>, "open list:OPENRISC ARCHITECTURE"
 <linux-openrisc@vger.kernel.org>, "open list:PARISC ARCHITECTURE"
 <linux-parisc@vger.kernel.org>, "open list:SUPERH"
 <linux-sh@vger.kernel.org>
Subject: Re: [PATCH v3] docs: directive `alias` for redirects
In-Reply-To: <20230504180210.727364-1-costa.shul@redhat.com>
References: <20230504180210.727364-1-costa.shul@redhat.com>
Date: Thu, 04 May 2023 12:41:21 -0600
Message-ID: <87ednwndm6.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_114129_626215_E08032CC 
X-CRM114-Status: GOOD (  11.62  )
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

Costa Shulyupin <costa.shul@redhat.com> writes:

> and several redirects for moved main arch pages
>
> Problems:
> - The documentation lacks hierarchy
> - Relocating pages disrupts external links to
>   the documentation and causes confusion for users
>
> Benefits:
> - Users can easily access relocated pages from external resources
> - Using redirects frees up options for reorganizing the documentation
>
> The solution:
> - Introduced directive `alias` which declares previous path of
>   a moved document as the argument.
> - Redirects are implemented with Sphinx extension rediraffe_redirects.
>
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
>
> ---
>
> Changes:
> - complete new implementation

I honestly don't know why you keep throwing versions of this at us.  In
the absence of observed problems, I don't see the value in adding
infrastructure that we have to maintain going forward.

Please stop with this for now.

Thanks,

jon

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
