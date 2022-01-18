Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BE3C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Jan 2022 11:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sU/DDgmwEe24d+dzEpf//q4RVLTcb6Ovgp0IF8bayLo=; b=dtZ194iAZRb3/O
	rPrI7sXYIsyXrmzjhfBAvLW48X+37rSGPS45wy7tQwglcQ0tO4iFA3dTGTL3u+r5TrHCA8iKHv8Mq
	YAJcDz3KCY6D9PtsCQWmRONDSOMefLwHecJk52/x4KN34l8rZLNpX7OB8sDvWM4fTvP8ZhDL64Wsl
	Ybnj3MtOnG3IkcLo2jc2s01RyVy7KXn09nDTGdBrS/0tWp6KN3tYkXB0UUV5Ng4mDt+O8djTxJNfG
	v2cDg9mNUDQk/12XcCClnptFZUeYKKWZgrwH+hvVVRslmcogPARboNWSTiuXEnaUpGkiyP+EA3hRE
	dZr05KI2SSsRJuZV7DNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9myP-001NCa-LD; Tue, 18 Jan 2022 11:48:25 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9myN-001NC3-2n
 for linux-snps-arc@lists.infradead.org; Tue, 18 Jan 2022 11:48:24 +0000
Received: by mail-pl1-x62c.google.com with SMTP id n11so22148114plf.4
 for <linux-snps-arc@lists.infradead.org>; Tue, 18 Jan 2022 03:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Dejh5tcJ4gWGMzdNPEhsckEWG7ff8PXHm722G9XwW+k=;
 b=lhyWQKxAG89IPXoDBrz6HFbtQzqa9iaOYj+PFdjDoTlmha8BtPoN/SFZIdB4e77qbZ
 CBlTTcpb1QSpDDgbaKs/yMQRWx9xJEXXy+ObN+vGaqwEMUHvNvPJBcdihgIWzbIbwIyi
 t0z3JbvURqorA6ScZQzlV6PZRhjt97uJ/0+BbBjzHQmSKSLHn+JB8eFs2Fs6o8tQ/mKQ
 rUwpVZK3W7hmfBhNJ7b3ynsP/J30cSDxjWsJesM1dv+MWnERRqVLqHEqhrY7T3xefrk/
 40Idt100/aXP2A0ckDAObcJP+ame/UJT0rubeLfx0tMIplSAiSL4vidJMCU86XCODEqc
 kKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Dejh5tcJ4gWGMzdNPEhsckEWG7ff8PXHm722G9XwW+k=;
 b=pBWDlRFGB1DkndC+9al26uKHl0kkHokpT/A6Tv1yXUlsBnt8H+6cLyTeX+y0iL5GWY
 hMCX7oxNiQIdQf2Jim8VPu+SY2oZD/1hrrj0KQTZ/VoAC8L5N3Vu8p0RvBYexnDNpqKQ
 S3Il1MsyxX+Hv+Fy9wTo61zYpENys2DujFT2ARAQk1jUMWIWswTuTc3Zukj79a4pjlej
 5+gugRwjUMHrkct+3HdR8XvzJC4MnZHqWrSww4HVhmWi0+SpJXGtVTmqRSDdzUMFm9hO
 fJ074yGrchtQXrpS4TXiwVZDTIaKDpqys57kWfRtGKp0eQwWm7lZTQnIpRX9CcQ2Goq9
 V/Ow==
X-Gm-Message-State: AOAM531PNOttlFdlaV1yXFoN59pkr3cGLOgvRt+lb+RTKHvGD3jGrpJr
 x04S6niigqwGN455HNlxzZE=
X-Google-Smtp-Source: ABdhPJxwzr02xBpJ396V3SpOF+QPWB4Svb44p09ND0mT7txf7kG/F8oGaHQopWM70s1EOb1e2640uQ==
X-Received: by 2002:a17:902:ec83:b0:14a:3c28:6820 with SMTP id
 x3-20020a170902ec8300b0014a3c286820mr27820410plg.43.1642506501286; 
 Tue, 18 Jan 2022 03:48:21 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id k9sm14959387pgr.47.2022.01.18.03.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 03:48:20 -0800 (PST)
Date: Tue, 18 Jan 2022 20:48:17 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Guo Ren <guoren@kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Michal Simek <monstr@monstr.eu>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, openrisc@lists.librecores.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-arch@linux-xtensa.org,
 linux-kernel@linux-xtensa.org
Subject: Re: architectures that still need to remove set_fs()
Message-ID: <YeapAai1NIuy0zV4@antec>
References: <20220118074836.GA20994@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220118074836.GA20994@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_034823_170095_793987B1 
X-CRM114-Status: GOOD (  17.35  )
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

Hi,

On Tue, Jan 18, 2022 at 08:48:36AM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> you are in this list because your architecture still implements and
> uses address space overrides using set_fs(), which are deprecated and
> have been removed from all mainstream architecture ports.  To help
> cleanup the core kernel it would be great to make progress on removing
> set_fs entirely.
> 
> The following steps are required:
> 
>  (1) implement the __get_kernel_nofault and __put_kernel_nofault
>      helper to access kernel memory without page faults, replacing
>      the get/put_user under set_fs(KERNEL_DS) abuse.  Mips has a good
>      example for a trivial implementation for architectures that use
>      a common address space in commit 04324f44cb69

Also see commit 08ee3a009f49a which is preparation for removing set_fs/get_fs
this commit implements __get_kernel_nofault/__put_kernel_nofault for mips.

>  (2) remove any architecture specific use of such constructs.  This
>      only affects ia64 and sh.
>  (3) stop selecting the SET_FS and remove all the set_fs-related
>      infrastructure.  The above mips commit is a good guide once again.
> 
> Thanks!

I will look into this for OpenRISC.

-Stafford

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
