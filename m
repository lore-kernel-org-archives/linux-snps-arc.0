Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7AFC43331
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 18:39:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A11A720716
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 18:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dJCqv3wr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A11A720716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mathFepOXmAjXni84I3W5l+PYmb5ef03imfOxbBszug=; b=dJCqv3wrqvdgDw
	eRAbAQJkHdbMEN+UgxQBbt7s0oXroyUfsCUihT+4dlooQ6hKkZ+8xOqQmecRTDlVFPcxlO7gyQ/ve
	AdsA+xY+SlP2fO8lELPPnqoepb3s2R/ShGbL/B8/jmAI9O2Je5+q1sKFgy2UAZ+W1K1YMXOKHNTR4
	pzsoEXrS2WMFt+aiR8CuBqOfb/68axTmDYd0nl+1G9g1Aoq/6gSmWcIDBoeZMyF6jfwJAeVzdlzmm
	jhIO+Df+Wq/42Ph3peJ3S/lgFVyoBwVUjBlInahIPiH1RWt1VQY+DfR5pDz6KgHBdGJzO/vFRsp+n
	q3NDaegOhlpl1R0nUkpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHtso-000198-DT; Fri, 27 Mar 2020 18:39:06 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHtsm-00018h-3g
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 18:39:05 +0000
IronPort-SDR: /2Dt14MOPV6ColD4ERsLbSYK4B1YTg3tn2xrzqDw9raC84ttDsGpDEMDjsiPgThlcwvwaC4ZrE
 oFkozids+nJ8hk8nPU2jl6w6tYdfYELxAKn/ZrJbKLRohyj4OmeyDCBRN0fm/C2oTZ2+eWKUPZ
 fC9shfZXzk/p5FSJW+KvYAQIld+Xf0nLTOtAzaUnzD1OrdKEkboEkjOu1BYB1Fygr7SuiGCYo8
 9/wdlcWXmVb/N/iTbv9S0yxWMZ/ibyA0v1mnftBdkRfSfbxBCNDL7+0REPm1u/nGKo8qijdv19
 y4I=
X-IronPort-AV: E=Sophos;i="5.72,313,1580803200"; d="scan'208";a="49161134"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa1.mentor.iphmx.com with ESMTP; 27 Mar 2020 10:39:03 -0800
IronPort-SDR: W1aiFQcqXAowTeoAfwbiX18MsBaSPixXFzhFrYH34HeteWD47lKG5IPWxAqIQkBGBKZrijo6nl
 9V/i+5a3Irmt4lVxWgItwXlOM2rtc41rLICRAeDQpW+VrdigFK4MKgETFd3NXGwqO7/2qA4dpM
 pRSHtSZ4SK/HKonkAFoG7yEgaFQk1PunuU+TU8w0YAlM12ty6zB/FaNrqLYF5sH/ZxttnL88mN
 XAuKv/Msnkt1C7PVkSdGP2p4ye0YzxIgfCG3N1BJM2dTMGijqW6rxImmf1TtbTY6tJBHSyY6nZ
 tVI=
Date: Fri, 27 Mar 2020 18:38:58 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 08/15] ARC: Linux Syscall Interface
In-Reply-To: <f0fd1b9f-d1fb-6492-18d5-2c1bed0941e3@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003271838070.5132@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-9-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003262342490.24611@digraph.polyomino.org.uk>
 <f0fd1b9f-d1fb-6492-18d5-2c1bed0941e3@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_113904_155274_04D997E8 
X-CRM114-Status: UNSURE (   3.12  )
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, 27 Mar 2020, Vineet Gupta via Libc-alpha wrote:

> But in grep'ing I see a weird thing: SO_RCVTIMEO in user exposed 
> socket.h has a totally different value from socket-constants.h - how is 
> that supposed to work.

The top-level bits/socket.h is only for OSes without their own 
bits/socket.h.  Thus it's not currently used, as both Hurd and Linux have 
their own sysdeps version.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
