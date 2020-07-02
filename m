Return-Path: <SRS0=5IfC=AN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4145C433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Jul 2020 21:27:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 628CB21707
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Jul 2020 21:27:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MbFKImVP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 628CB21707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1DMQEtwuClpBBpM3N/QrJzwUFZGy3IxKy5HTjy2yQUQ=; b=MbFKImVPjJLrJY3Udb8M3nCUz
	oR67jDaU4+vyAuMWYe9ipMsmPvzLLWI/WSRATGZ8e7JneotKAFhJI+6xVe4z/BgU4rwnN8wHuioK/
	2iCzMo02UtgqISTu6aW3x7sKVemuEEeZ/wjSzRleFf2zR9+x0D5oArxYUAWKGciYTolCcMUPM6uUW
	liumtvfbawOhaLs4KLFYyGGhaNSQ8KZYbt7mbV1r09t/kgN/BHPc8xIsfGr4FO2nj86sdZm9z1HlS
	fHqsMRghqtSJTtOhVf7E6twwdr8UFYBDgAYOgdVR+7AdKEVVOM/w0X1pNcydcjnm0dsy2B/qk0UCm
	8OGWvK23Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr6k8-0004xV-QN; Thu, 02 Jul 2020 21:27:40 +0000
Received: from esa2.mentor.iphmx.com ([68.232.141.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr6k6-0004wK-Gb
 for linux-snps-arc@lists.infradead.org; Thu, 02 Jul 2020 21:27:39 +0000
IronPort-SDR: m4Iw1FXaEZ5WPtSdq4MZsVgyW4UBtMVlwLJ9u2I7w3GlOcAiFMVcKM87GXloVN8x92BbeiUQ6F
 s2vWP4I/mx7VAWNVcRzTXpcAAkFZL8HXirLGeYyXGfXlxeKxgTMQKrYx+X8a/dYM3zkNF0kY+9
 A81a+ZMWkmf4FRcAHahDc69+d34VNfHGMHtznUruIgx0c3h6Z7qmdxDJCw3MF32VU9tFWStTKz
 d4p0//dxMg4eKXHE2p3Vg/LL1W8J1BVdHbS6yxmSDm/zRi1cgbf7ZTTnw9Dab5O8SjRTisOc1P
 5SQ=
X-IronPort-AV: E=Sophos;i="5.75,305,1589270400"; d="scan'208";a="50561748"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa2.mentor.iphmx.com with ESMTP; 02 Jul 2020 13:27:36 -0800
IronPort-SDR: +fSNAVU5l14LI24aB3RbwW3uXkdFskJEuMLyhdZgFG0LBEmTW4ZMw7wsBnPKUNmn2ee+B8CEce
 aHwAPaPJa5y0Qvo1sbYepYdjxMzwlshpzWll+FH8Sfv4U7jfE8NVtN5KWKia3/AVvps5rkCU1V
 J4etnP/ZQZx5FxvdRutxZO+mGnySwmK/NujJelYFCfD2h1aSVinxEih2e+i0q2tz9+PgpriDlC
 cqP202FIDmTZFjC9/2/qZAv2RtR9klQQ3O6VbblqiiOpJDzz4N+UhzWOkwnWHFPfrpFyYKmOwf
 r6w=
Date: Thu, 2 Jul 2020 21:27:32 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Subject: Re: [PATCH v7 00/13] glibc port to ARC processors
In-Reply-To: <9c1ae166-4e37-e8ab-d6c6-cdbda5b15d83@linaro.org>
Message-ID: <alpine.DEB.2.21.2007022116030.21468@digraph.polyomino.org.uk>
References: <20200615201441.31820-1-vgupta@synopsys.com>
 <c5edd9af-9dc6-d572-4779-6897e43c0a31@synopsys.com>
 <a3afd7ef-87d9-f033-fea3-f4854b9188ef@synopsys.com>
 <9c1ae166-4e37-e8ab-d6c6-cdbda5b15d83@linaro.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_172738_714449_1CEE351C 
X-CRM114-Status: UNSURE (   2.44  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, 30 Jun 2020, Adhemerval Zanella via Libc-alpha wrote:

> >>> | FAIL: stdio-common/bug22		# Needs more RAM: 2 GB memory
> 
> We might try to enhance this test to avoid require too much memory.

Note this is bug 14231 (covering test-vfprintf as well, which also 
requires a large amount of memory).  Although arguably the real bug is in 
the printf code, which shouldn't need so much memory (bugs 17829, 21127, 
24988, maybe others).

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
