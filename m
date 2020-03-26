Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEA9C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 18:49:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BFD720714
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 18:49:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="osku87jG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BFD720714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4XRsvmM3/bTOA0r9ioInJzjsHDXg6prUjzpiE2T9h4=; b=osku87jG7OV/CV
	314mixkRGQrVcYmls9blnN9rX5sj8+RFTaFwBzbKXkhTDQbMGmdptx8EHAOzIbV9CVuu9LA21ILw0
	Flv/8//hNx6f0BUeykv+DHf+ZLPNKw9YWyu3o0LD+AbYefBVtYIVAr2P5Qze+2fXMrjCa3MumCnQZ
	3TRC0FNrWpZWnKpk4jlaWQgojHuhviKvs7+rVrCNHbLJf6naOOQNGwpA7K74jimlXydsaAQGRP9Pr
	i6rlfXHw1oUin0ZK4PYx+Dhm5SRbaRnvdJDEXgDwqMTfnF2jB7/99ajctllcA+EKt5gs+OtxQOzmW
	vdJNOwzY4AV7VYXuaisA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHXYt-0006yM-EP; Thu, 26 Mar 2020 18:49:03 +0000
Received: from esa4.mentor.iphmx.com ([68.232.137.252])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHXYq-0006xz-4o
 for linux-snps-arc@lists.infradead.org; Thu, 26 Mar 2020 18:49:01 +0000
IronPort-SDR: YIlJzppgINLif2J4w4I9aiu0/rX0SMO8CkbFOl0NILnDAxzDoJ8ENOR1NlR7dhMA4i3r6SVBWw
 kBQ1fRLnfsK+RMasBR/vyO07x50eQLoP1PzrGGCGgP9cD2tLUHn8Rd4WF4uTEHaaX3og9BAfAt
 hHKQCRCdH20AIngGy1otFPyS0V1GVoYx8EIBVKl23DhcAEqVMJn+aeJdHropMEsJuMLVyA9UHQ
 JvYL8JkQE3l7mgWJHr1F651pvzzL6JOkNcKqYjIR6ooNsTKaoEWd0Y944BE0Sfj2BwF4kzyMao
 DX8=
X-IronPort-AV: E=Sophos;i="5.72,309,1580803200"; d="scan'208";a="47196346"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa4.mentor.iphmx.com with ESMTP; 26 Mar 2020 10:48:59 -0800
IronPort-SDR: ZehrLUSQygCyZ4AYh6jrf5s6pA1+HspaGHZL7AEVvdnwW+I6ZEscNVfemrAJdDGn90UbAvxPWX
 h7G9wmPMUPxzcj98DDnB1euGBJSgZTElQ0W7DOvMCh1yPL1cdwiJ1jfYHsXyjL7ZHKXaOpdZkK
 PG8abtyvDqn6Q2vYNKjctgBpFGjm57o9rrl5esEgCkh7sfmyBasDxuCikN73pVXoL+h4QJv2C6
 gGGJDy77QTW9pbWoGDmB1/2xhfTEwAlQJHmGHqy52z5fAHCDlh9Fm12Xpc4MTrX8P1irrUv6UH
 +oE=
Date: Thu, 26 Mar 2020 18:48:54 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <vineetg76@gmail.com>
Subject: Re: [PATCH v4 02/15] ARC: ABI Implementation
In-Reply-To: <7a3df848-1ef6-9e54-3b5a-9cdfcaf436a7@gmail.com>
Message-ID: <alpine.DEB.2.21.2003261843120.24611@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-3-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003260138130.31593@digraph.polyomino.org.uk>
 <7a3df848-1ef6-9e54-3b5a-9cdfcaf436a7@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_114900_219419_9EF189C3 
X-CRM114-Status: UNSURE (   7.26  )
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

On Wed, 25 Mar 2020, Vineet Gupta via Libc-alpha wrote:

> Hardware-wise, ARC can be configured to be LE or BE and software supports that
> (cfr Linux or uClibc). The initial glibc port was only aiming LE but we ended up
> with BE as well due to a customer engagement. And given much of ARC port is
> currently generic (minimal asm), no real change was needed except enabling it in
> this header. We do plan to officially support it so I guess we need some more
> changes in Documentation / ABI listing etc.

Yes, if you want to support BE then it should be documented as supported, 
it should have its own dynamic linker name (with consequent GCC change 
required to use that name) and it should have its own build in 
build-many-glibcs.py.

> Right, we've had 2 ARC ISA: current generation ARCv2 (basis for HS3x and HS4x
> processors) and the older ARCompact (ARC700 cores which run Linux and still
> supported e.g. in Mellanox NPS cores). From instruction set pov they are very
> similar (although not binary compatible).

If they're not binary compatible (so you can't have a binary that works on 
both) that indicates they should also be considered separate ABIs (so you 
have four dynamic linker names, each with corresponding build in 
build-many-glibcs.py, plus any other variants that are relevant to build 
in build-many-glibcs.py without being different ABIs, such as hard/soft 
float).

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
