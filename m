Return-Path: <SRS0=Wyqd=AS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855DCC433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 20:36:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DF9D206BE
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 20:36:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kB0O1M8S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DF9D206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oqlukD0k1R1vThnGXrWT2EAG3gur8rp6/6kc2YJYNYY=; b=kB0O1M8SFCNkj9KCCTBXyiHCL
	F4KQZLTcpctLFxRA6Kv4PSADN68TV9pdub7SfGzaRrXUTPVnpvZgp7MVCnbK0Bg0ZDqZtTv/TGsQ5
	u9Fm7HFSpTYn0fFRpjUClomE6r9jkdFAS/OkdkmDsdISnlGJ3wT0Tq5HVpoi4y18CPSrZZqgyXfkT
	pvRtSA1t8g57OaoXg1f5lFzpdaMe0AXagT4MxDJFTdxT1CR9dFDTxtlBLkAyAfpsJjehdtBmlyady
	uIEX21evJlfRZqufV40TEKgsrAi6dyOcZCnc1kuDQVEZBxTzBcLSWuLQtwrFRNAzjeo0lRnXbX5xo
	a+B9H8Y5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsuK9-0002FP-9H; Tue, 07 Jul 2020 20:36:17 +0000
Received: from esa4.mentor.iphmx.com ([68.232.137.252])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsuK6-0002Em-FV
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jul 2020 20:36:16 +0000
IronPort-SDR: HwVcliZge5J8oCxHIot8zih0ctIaF56czs34rKeQNBYqTmAmFp3EToCIG80gzlGEesi8Gco0Tr
 3EdHMae3K498wVOUVm+HLGkDdsPa/XofpmLN9kbBhgW9XuO2yWC1ULiuVWdmcl+vGFU4XtP2UO
 AEzUvfRZZN9w1uTtwwOBmykA32SWH8NLAiboAUCjlUNRTn3pqLWZdo2sW7x1DbGvGeZKFkqyfh
 KOR9ahdhF/gmbQBPao7XfCaJRsOtfZiqGFuiKbNCCQS6i8QQWOmxHpatubcHfr88Tmcozpwb13
 qzU=
X-IronPort-AV: E=Sophos;i="5.75,325,1589270400"; d="scan'208";a="50808611"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa4.mentor.iphmx.com with ESMTP; 07 Jul 2020 12:36:07 -0800
IronPort-SDR: R4lg/SgpAoLMb/779/gwrpb1HtMdf75+sGgRPsTyU72jC0s+AHYmmBLOHzmnEb3CtWIOa1rPdG
 Exd7Yn2mrmE1ISaRtKiROe9ynEviDSkxu7aZanNX6vwGErAimD8utNiDpp+LXdFVzbMhUpT3Hz
 i7e2LclEm5MiTrlFIUs3J053RBcrjY2i8ZzvM20iSNscCzfwypYJAMj02fAg1WxggeWXUzFQeV
 uQA41hvB1Y5CtM7SL5td0aLpbuWWjAeRstAgiblow2xsmfijecJtXU0tj3WBVb4rYSGTW2FYB6
 k6Q=
Date: Tue, 7 Jul 2020 20:36:02 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH 1/3] y2038: linux: Provide __futimes64 implementation
In-Reply-To: <d93d6c50-92e7-65aa-9ee8-990c7a036ef3@synopsys.com>
Message-ID: <alpine.DEB.2.21.2007072027450.16069@digraph.polyomino.org.uk>
References: <20200217131735.18180-1-lukma@denx.de>
 <20200217131735.18180-2-lukma@denx.de>
 <347a5a21-c308-4fae-5b80-34ee22fe8c78@synopsys.com>
 <20200707092120.071d5157@jawa>
 <d93d6c50-92e7-65aa-9ee8-990c7a036ef3@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_163614_644448_6C703262 
X-CRM114-Status: UNSURE (   6.21  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>, Lukasz Majewski <lukma@denx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, 7 Jul 2020, Vineet Gupta via Libc-alpha wrote:

> The issue is generic/utimes.c
> 
> Is that the right file to build. If yes then it needs fixing as it expects
> __NR_utimensat (and thus require the aliasing hack in ARC sysdep.h)

It was the right file to build, back when sysdeps/unix/sysv/linux/utimes.c 
required a utimes syscall to be present and architectures with the generic 
syscall interface didn't gave one.

Now, there is nothing in sysdeps/unix/sysv/linux/utimes.c that wouldn't 
work on asm-generic architectures.  So generic/utimes.c should be removed.  
Likewise, hppa/utimes.c should also be removed (now that 
sysdeps/unix/sysv/linux/utimes.c doesn't use the utimes syscalls, it 
doesn't matter than hppa got it late), and the __ASSUME_UTIMES definition 
in sysdeps/unix/sysv/linux/hppa/kernel-features.h should also be removed 
(because nothing will use it once the hppa utimes.c goes away).

Similarly, there is no longer a need for generic/futimesat.c so that can 
go away as well.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
