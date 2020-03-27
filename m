Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E701C43331
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 22:49:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9D1F2071B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 22:49:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K1SiFkX0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9D1F2071B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhKIpjJCCHo/+096HEkDDtN07q8+4lbALT978Mbt2kY=; b=K1SiFkX0n6SZzq
	L6dkOm7TQkTNWO9k191s51O5nXMiEDFLonHMYH3nXlIZdpIKGIuYyoQRg0rgUleECgbb4q9hB+HeG
	+AE/Ce+MfFJtmu0yBk9r/Z0XtYDwAYysbzPtlZc6Qi9wiS6r6WP6ax2O/yaEKlte1niG6CacI4HIy
	qWwReGU+KAFcu2wwuwra/etsxMmBKzR6S4XWdt1GrE1jf/E/vLqfnmYVnmhP+Ns1G8Bwx5hrh7cqK
	D4ZxCQAE4M7yL8aaBWl4yOQj40b7bDHeHzVc4SHifRqhOc9oIwyT8d0uhPj1+Gh1l4fHfaLteV/6m
	LbPg18694jFe2C5ApyBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHxmr-0006Jh-AH; Fri, 27 Mar 2020 22:49:13 +0000
Received: from esa3.mentor.iphmx.com ([68.232.137.180])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHxmp-0006JQ-DF
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 22:49:12 +0000
IronPort-SDR: cKy2bj+XVFURXfvcAHiBFF6HEvYW2LUJVaQXS33xP7+MHlcUfRef6IcVBjQm3bZJfuKpgQJSRD
 BkeG/pFjtwLfteLmT1vrQqF/MAVL+sfjspKcyJs0OmZ50nGWdaYxRB69cRMjMiQjRRRb84tDHa
 msYmjtX/59nMw5r+5EOBiYgxeEmNmy38wZVE9MF2/vxplqruYviire/q3uQnUHH6ov1Gbrumf6
 cHW8kDPRAkCrVVWjtw1XOkzDmFdNQhicup5iHju+ubBrFGw679RdXknmowXFtHN4sS3OvP7uuO
 jq4=
X-IronPort-AV: E=Sophos;i="5.72,314,1580803200"; d="scan'208";a="47200163"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 27 Mar 2020 14:49:06 -0800
IronPort-SDR: 2JwwuEXAYlwbRn3wD6gcs+whugGGCfdcJvEBPgAnlmZ0+2LrNasN8f3kEDe5DqRFw15sy5fXXn
 gp7z9eJfF20wW3o2+8IkRKaiLEWCc43u1NBhhiETwmnU9AGG2VZc1fapNd3CyFKR4Y5GmCZsI+
 9E/t98wvmij25hTyEtRbJNV0NNQFfr0QopSvNG+OeC/R33FAGYWTCPLMWge1HJB1//hTl1jyPQ
 gw1EPQwzuOmLO5MYjfJ8b37rcXjab2NiOSi8gf4g+WQrJmBGSJbLGjOVuzmqwx7cwK3zDYa7b3
 8Z4=
Date: Fri, 27 Mar 2020 22:49:01 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 15/15] Documentation for ARC port
In-Reply-To: <20200313030419.15843-16-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003272247560.5132@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-16-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_154911_480237_CFF5F031 
X-CRM114-Status: UNSURE (   3.55  )
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
Cc: linux-snps-arc@lists.infradead.org, libc-alpha@sourceware.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, 12 Mar 2020, Vineet Gupta via Libc-alpha wrote:

> +* Support for ARC HS cores running Linux has been contributed by Synopsys.
> +
> +  Port requires atleast
> +    - binutils-2.32 (binutils-2_31-branch: commit 6ce881c15fc4, 2018-10-04)
> +    - gcc 8.3 (gcc-8-stable: commit 0d5ba57508c5, 2019-01-29)
> +    - Linux kernel 5.1+
> +
> +  ISA: ARCv2
> +  ABI: 32-bit, soft-float, LE: /lib/ld-linux-arc.so.2 (compatible with
> +       hard-float builds)

I don't think the default of the dynamic linker name etc. (which should go 
on https://sourceware.org/glibc/wiki/ABIList) belong in the NEWS entry.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
