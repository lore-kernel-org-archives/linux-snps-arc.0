Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAB6C43331
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 23:35:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C7AB206E6
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 23:35:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BRncGkLj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C7AB206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWOop6/+ya8s9b1AYTIgH9NIgTBhBsz4MSerpZ5lF3E=; b=BRncGkLjyu/DKN
	Abje/IVfmx0GdDroQ3eCuGnLi9FuMCnNQ0c2uSP5qk3ZqiuNQfWk0NB+ZgKvWeU8I4NqAzlw1ssZx
	Qnjrn2XJXVydAf5URVXqQ0IcuA93u/dVqzVCtsWyhq4y0oOJU1pSkY1tMRk89vF5fZuL5HpUZHsJH
	HhWTKQ0VsmFJ4agERvytmczb4Zl4OpGOGU68T3rOmXPE5cB/SX1CJtQl82AiNo9Lp/KB3pl7qUxtd
	YkBMIiI5Mud81FvX0uLTHTy8yZpKAnOxa7/NehKyLseUISTBGaEwzcO1Rq89CNuyHC4x8IT0opNCV
	nVMx7U1qcp+l1W6egOjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHyVf-0005hK-Bj; Fri, 27 Mar 2020 23:35:31 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHyVc-0005h3-GF
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 23:35:30 +0000
IronPort-SDR: NfhI5T+iUALKjgfEcXCDNroU8A15mdv9QbKWiVcuttP/P5mG4zT5YUQXzxmmavcQScFenpHOUp
 RuDQRbZu/8esDgLCMFKyLskOdIdJedHj2kd6Gn7kV6NqFzOBswu0vcf5fctXlLDlLN6UVfjX7u
 a3dg/0yBF8tdSz4ddUmrScKm2fPxKtZyeACM7xWfcsYP3ILiMNx8CByRK1fdTerV0EERivFGaA
 b7/zKWHjekTEWBv+ghCbBVOnqhAVSfGuUYgQSBqe/BMgpEYsJ+Fh37IMTZNiRpoJ7tHitO1SVw
 ufo=
X-IronPort-AV: E=Sophos;i="5.72,314,1580803200"; d="scan'208";a="49172467"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa1.mentor.iphmx.com with ESMTP; 27 Mar 2020 15:35:28 -0800
IronPort-SDR: oI8fq3WNIgRzPTy/ZhiAPqkhhJCGfvdThyuyxvCpyhJzQ5aiiboRqEgNGSw54Cwq/xoJ9c+wCr
 5NfujZSlJzm36jmpKugpCc65vaz3N0ot+PdvvgPPy9lftCinqYmuzFrBLUI/nf4pO6o/AgxuxN
 tz1Ha76VszAwNf1yewVrP+gMZwAhNIeseVzrvqm9VbBqNuIrH2f7X1tN/9Zrhr7wl7kQ0d8+DN
 F7A5Of3ixb159dpfeE+7VRqJ40WsgnBfghFJRY13bi5+qnERMSidIEmvU6QoHooiZ9UX4f5FUL
 4+g=
Date: Fri, 27 Mar 2020 23:35:23 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 02/15] ARC: ABI Implementation
In-Reply-To: <22f16d08-b33e-f200-601b-4e0db6de4cf6@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003272334320.5132@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-3-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003260138130.31593@digraph.polyomino.org.uk>
 <7a3df848-1ef6-9e54-3b5a-9cdfcaf436a7@gmail.com>
 <alpine.DEB.2.21.2003261843120.24611@digraph.polyomino.org.uk>
 <22f16d08-b33e-f200-601b-4e0db6de4cf6@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_163528_547572_7D0118FE 
X-CRM114-Status: UNSURE (   4.08  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, 27 Mar 2020, Vineet Gupta via Libc-alpha wrote:

> I added bits in sysdeps/arc/configure.ac and corresponding conditional in
> shlib-version. But I have to ask (embarrassingly). how to I regenerate
> sysdeps/arc/configure.  I tried all possibe autoconf cmds with toggles (both at
> top and in sysdeps/arc) and even reran configure in build tree with
> --enable-maintainer-mode

autoconf sysdeps/arc/configure.ac > sysdeps/arc/configure

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
