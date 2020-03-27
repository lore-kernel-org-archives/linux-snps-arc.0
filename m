Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A6EC43331
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 18:39:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51A7D206F2
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 18:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="go6QAwtD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51A7D206F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dD5SJFPFyNbyRwr3YyWEMRYunNu0V+KS9aUxNaprQPo=; b=go6QAwtDNBovUc
	4TJgA5McRutyut1sMhEwWJmgIql3ndmCkf1ySDyvO2ITIhcQew14575oKODf2hs4ANInFBU8CUKPz
	G9inR+a7ms6mHo66627axffIUC5UY7X5TdKunTobck/tkfT1kSJScp/G7DFni2W/GymwX6SHDhnD3
	DqT81eVXelay8pkaa60YavmxJmuT03y/HcK2HF5k8n8lLCI9GGdZYKP69/QMHCzl/rCb6rFMimCCn
	5srz75447leDyq/J5uJXmse78cqFZrJFDGiXba+C2GZSFsmQpytuqQWeJFYnMMYDVEPxT/x/33Dwg
	CSbi5Yf/P4g7JHuuWGlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHttN-0001Bu-M4; Fri, 27 Mar 2020 18:39:41 +0000
Received: from esa4.mentor.iphmx.com ([68.232.137.252])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHttL-0001BO-Au
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 18:39:40 +0000
IronPort-SDR: 9xK1WI9A70whmw/2i1KaP4Kz6sB2F3U1k9kLldn756teS69YCpoJdk+3kFtHr+EJUXYurS5T8v
 O6jWym2aMpgoInydcM3wkzzaghCdOoGOYsV4mOtY85R5+R9FMgm/zARHWsZzEZxionVIg8iXtR
 iapcUOIEbamNUJx5AU464WGfR4VYMdGnhrajKvB5jbKkH+E6FEhtQycbo4RQ5dbcnab0i1M7eR
 4RJt1rpupjh6anoP71or+9tJwz9dkmZkog3vvN3rqGp65oVJF7tm+umiP/AyjK7ad9GUXDt1Wh
 WpM=
X-IronPort-AV: E=Sophos;i="5.72,313,1580803200"; d="scan'208";a="47235934"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa4.mentor.iphmx.com with ESMTP; 27 Mar 2020 10:39:30 -0800
IronPort-SDR: Pye49sdfDVbi/jVUuCQd3DhXe5vQtik0CxXN3NnNEP4F+MU97pwMHAN7l/Z5qTMXZ9oyjhJiNm
 gtevenrcUUXL2s0uq7PIL3XAD9I6HLyR7t4kl+cTxyIq4aGk6dWVo6wbPnON5SMXZy9u1iMOxT
 rW55wSSxEn4Wgx48rczy/Qkv8bz+zZnszIcXltAm01TgyUxgfnkAinLEL7cUEc/QWM44K/TFwF
 Hrp3BqHm8+cj8hCWHo0b7Y/CsZFKEr0ytNWQRQzi+605n5iyhHGsya+p8aTcgXl+UazZJI5uer
 hCk=
Date: Fri, 27 Mar 2020 18:39:25 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 11/15] ARC: ABI lists
In-Reply-To: <96e4c23d-d81c-6622-b7f1-6fe8e9bb06ed@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003271839050.5132@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-12-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003270039380.24611@digraph.polyomino.org.uk>
 <96e4c23d-d81c-6622-b7f1-6fe8e9bb06ed@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_113939_413790_FB74BDA3 
X-CRM114-Status: UNSURE (   2.31  )
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

> Done now. FWIW regen-ulps simply barfs so these need to be hand edited.

What exactly is the regen-ulps problem?  It ought to be working for all 
ports.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
