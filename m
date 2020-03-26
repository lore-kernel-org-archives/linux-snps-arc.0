Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B97CC2D0E9
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 01:57:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BA022073E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 01:57:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F6KKPsct"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BA022073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4Z4ayzMWwPVnYlOP8GkUct4ucSVRSnawkNIiiLnMsQ=; b=F6KKPsctL/41oi
	IpMvHHchrirdxatUKfoIvmtotTPPBJ+PuW8B0aoXQXCA0ygK/5eBg8RzLsb1l8h4s62fDdzVpiqsR
	OyWEZMSYIKpD6vF57fKtX6icaTpZw60nX5uwU0LcEdyedCKpMnCyEEixrBZ0XNXIPF2B9AlGNmSdV
	Edto+nzidbmenRsJsuKJoW1c8sdUTAX3ltrcdWmiU8WwBAEDKSOjyBoQmK3jZxXK+l/q7qRTfOb+t
	2mIVg7QutMLK2yol704huKT23cPekV125B2rVsKF72HJM3WIio6yhEVyJtDzYwgOSzNNMMC9rnPKV
	Toh0ksM6g46emTPxAykA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHHmL-0007SM-Hl; Thu, 26 Mar 2020 01:57:53 +0000
Received: from esa2.mentor.iphmx.com ([68.232.141.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHHmI-0007S3-GI
 for linux-snps-arc@lists.infradead.org; Thu, 26 Mar 2020 01:57:52 +0000
IronPort-SDR: /8SNMbLc9Apu2cyTtiYU884WWadi4lyUN+9aXZL7Hc5/i9NS63M2uzQtBIstDO/yAJVpa+R8yF
 16GCUyWnUA9wphMhecJm/GKBrlIUuTUQHHIrs0jN93NPP+j/QxiYsj09CcF2XqyiDB3iiPhMIF
 OCTvpmOA6Aoggax1R/PqpVBIQNwmonAuZIpbppJJqa/rKRqBe3OSushSamHdKWs3iQgn9K/YwI
 Qswf5kyOdQrSfKj9s5MMo5J6Ml7m0cHwXzSpXfAem3aOAxwUXVhexx+mYImUazCqdVyFHZEeFN
 cek=
X-IronPort-AV: E=Sophos;i="5.72,306,1580803200"; d="scan'208";a="47033952"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa2.mentor.iphmx.com with ESMTP; 25 Mar 2020 17:57:48 -0800
IronPort-SDR: m+7YslJ3Gbm4PDJrb5q3uVY6kWLYj/O47uFGoHqyTeFJXhLrQEKxeUurqwEp323F9M5MGKPpAi
 9qrfROzSSc4grxw4of2OZ90rPGRwHsFpVZzRY/51NQkwe01ZcRnotoWczFAKi2NbSlD4jP0fc/
 3Kn4GlS9oqk45N+TZu0YJEQnLrDjBKBcvocQew782gVllK/ateKIHstmZ69N796hZHn6/Ef6bW
 IDHkOVtM59AcyVgAStOkuaS8Ong2OfUnZ7ZI4f+ZJ1Nm3hDw7sjvYPJ1hgGLQ8LuZ6i1afHhwo
 Kok=
Date: Thu, 26 Mar 2020 01:57:43 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 04/15] ARC: Thread Local Storage support
In-Reply-To: <20200313030419.15843-5-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003260157030.31593@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-5-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_185750_570063_53110D76 
X-CRM114-Status: UNSURE (   2.76  )
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

> +-- Derive offsets relative to the thread register.
> +#define thread_offsetof(mem)	(long)(offsetof(struct pthread, mem) - sizeof(struct pthread))

Missing spaces before '(' in calls to offsetof and sizeof.

> +TLS_TCB_SIZE            	sizeof(tcbhead_t)
> +
> +PTHREAD_TID			offsetof(struct pthread, tid)

Likewise.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
