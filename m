Return-Path: <SRS0=p2sK=6B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDF3C2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:20:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED923221EA
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:20:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CqbGTcml"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED923221EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=825scBEWjcFpS+z2uvOtumsKLCGbuOJw8tZyXR92Q08=; b=CqbGTcmlOVfupQ
	gZqLrxyAJiLrjLjhjZCYBiMCHVFZv+xUTXQxYDtGwi8c6gFYbq4Q3WVTJ65UXcVrcK2SmtT4rBCNf
	c9szMtxfnkUJZi+CSklKatumqi/JacoeyKJEP14yASUqKnjBH74FkJpTQsiz4KWGwGWnQpRghF+7e
	BCm6tIe3g8L/MUtbR4MIcby+qnK/Uyf7GSfgc802JS3Q5JQZV3na2QXC4IWqZjFlQJXnmRfAyS4xk
	YGTQDRaWizmErfpOHSNk6Cm+4ULB4SHs24jYleciSiRaF95LjEliJR6ZZVrVoLcUFpxUiE2r1qqn1
	NR3s6DXeZeJanw/H1sKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPaHQ-0001bb-VR; Fri, 17 Apr 2020 23:20:16 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPaHN-000112-Gu
 for linux-snps-arc@lists.infradead.org; Fri, 17 Apr 2020 23:20:15 +0000
IronPort-SDR: s1WDF3W0axBB68Gmo5n01f64IcOCHvfP4s1lRo7L2IOeiNgE3pW7TydspKILFd4soBTm+hSFzx
 cqrPFL3ZoUEIzCKq50Cxf31tISxF4/j6bqLBruqzWi1i0e4/rc9ctGKItRWUKLP2G9T18r9hcq
 KJFpgH6XH+F31m8lhGeuJs/4cjtVxzKPG3wqmZw3xjkosz72A3bFqJouXNR76oM41ZwEmbyU+/
 +MXdvTv3s3wTw5TS3jfjqlhjEkwviMk2QvLu5guFVYSSvrBqITWCSuZjaS7kC/w6p5uWMkRJzO
 Cbw=
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="49930305"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 17 Apr 2020 15:20:12 -0800
IronPort-SDR: nP8PJSkNz+J2ZIBspj/eiM6SBLcsxAAqe94SrZUenqUy3T30oFXVg0OXOAGLBP+SsXay3gScE+
 N7HtxAHMJjMAsZz4UKDHLNQbgU86SW3nKVYCJQM8dvXLEEDZ4+rlNvDxscSjBr/mzBb9J2IGEK
 OJk3ON0GVPFMMWS0/OyNOCnd0xU3S+EMY3uvvBzTvVm+cwzbAF29Y3pUI3Z6hYUFrR9kE9Klnh
 4E/T0Xi/fYhZd38sLIim8D5o2Fbhfv4gwLpN/SixEY9y64ZOPYyc/Iu0gOQjRrHqBitwb/3w10
 vRo=
Date: Fri, 17 Apr 2020 23:20:06 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v2] provide y2038 safe socket constants for
 default/asm-generic ABI
In-Reply-To: <20200331213208.22543-1-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2004172320030.1082@digraph.polyomino.org.uk>
References: <alpine.DEB.2.21.2003312122350.30236@digraph.polyomino.org.uk>
 <20200331213208.22543-1-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_162013_675019_CCA43766 
X-CRM114-Status: UNSURE (   1.66  )
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
Cc: Stepan Golosunov <stepan@golosunov.pp.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 linux-snps-arc@lists.infradead.org, libc-alpha@sourceware.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This patch is OK.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
