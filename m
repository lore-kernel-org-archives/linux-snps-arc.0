Return-Path: <SRS0=Q4Kc=GT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EFEC433E0
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Jan 2021 15:29:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF1102310F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Jan 2021 15:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF1102310F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zjlJznHubfdXdps5F83Py5ZQHOL1sBo5YVNI8S6qsKo=; b=M3VpXWcDwx2J5qz5IsJDUTffg
	mNkLdl+RXfXdEBS4P8rUguQ+1sBZuYCquFtXLPjddXNUIGt5/lsJOfC1EFyZM6wcPcqpm3PFTiBu9
	6mqB0zIp7s3A2Mj0bnMJQvEh6WB0bWfQ3KYwUuTId4ldqU2fzOIql40hlOgXkc6Uh/Mm9kxbLiATS
	co+qZ3coyibWRqaeAqCtvSfj92vMLU+Vdr/Z0n1pezXv/1O4/CN4vQrUUepRs6g7bXgzMlSwvdbYH
	1mBBRnB72i2DPhSbteQ9cS93bvMM4IwCjgEHsTy3LR1jmSuORC8GuDh2M3X55RpHUHmOWYDllokYt
	9NkhKLNMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0nWM-0005yi-Ij; Sat, 16 Jan 2021 15:29:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0nWL-0005ya-F0
 for linux-snps-arc@merlin.infradead.org; Sat, 16 Jan 2021 15:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fOp0wPZtwPaopF/18DuiZq1+0U6KsnFihDUwZDn1P3M=; b=VUBhHsBDZgzqZ4UA1vW5E5cMfI
 le9M4DbIhLzhuLa/d7uYfUro6JwJp9M+thmN36gj7rSLTZYYD+LkRM+uPRiOhoFwu8wpwTse7fIWR
 nuqtMHMxjbLENRp+m2PSzDG5R8NuiOemiDQei0+v8zEqhNFCZsKNjoijaJC2LrYe4SpvFpBqhCSSu
 QIIO49HoBX+Dth6UQHGx1F3l7rcLpdjKfC96a91kD3euSnC7DtJxOFYgofiKqmnwDybmxm/axoBM3
 9Ydc2k6WiH38u1XU7N5NsnAX/pz6cVXKySiyKlulzpz7+p/wJDXt8HfpEMdZED3YhdYgTnjivPFFB
 RU0s6ERg==;
Received: from smtpfb1-g21.free.fr ([212.27.42.9])
 by casper.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1l0nWC-00AP36-Tq
 for linux-snps-arc@lists.infradead.org; Sat, 16 Jan 2021 15:29:39 +0000
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtpfb1-g21.free.fr (Postfix) with ESMTP id B007FDF9D58
 for <linux-snps-arc@lists.infradead.org>; Sat, 16 Jan 2021 16:29:26 +0100 (CET)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1021:5979:3424:ca69])
 (Authenticated sender: yann.morin.1998)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E2A655FFBD;
 Sat, 16 Jan 2021 16:29:10 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Jan 2021 16:29:10 +0100
Date: Sat, 16 Jan 2021 16:29:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [Buildroot] [PATCH 0/4] ARC updates
Message-ID: <20210116152910.GJ2375@scaer>
References: <20210115200319.4139041-1-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115200319.4139041-1-vgupta@synopsys.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_152939_672098_C8B2BABF 
X-CRM114-Status: UNSURE (   8.86  )
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
Cc: buildroot@busybox.net, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Vineet, All,

On 2021-01-15 12:03 -0800, Vineet Gupta spake thusly:
> PFA assorted ARC changes. Main being a hw config for -mcpu=hs4x which
> schedules code for HS48x dual issue pipeline.

Series applied to master, thanks!

I have however done a bit of changes, so I will reply individually to
affected patches.

Regards,
Yann E. MORIN.

> Thx,
> -Vineet
> 
> Vineet Gupta (4):
>   ARC: Add support for generic HS48 processor
>   configs/snps_archs38_hsdk_defconfig: refresh defconfig
>   configs/snps_archs38_hsdk_defconfig: switch to glibc hard-float
>   configs/snps_archs38_hsdk_defconfig: update for better out-of-box
>     experience
> 
>  arch/Config.in.arc                  | 16 +++++++++----
>  configs/snps_archs38_hsdk_defconfig | 36 +++++++++++++++--------------
>  2 files changed, 30 insertions(+), 22 deletions(-)
> 
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
