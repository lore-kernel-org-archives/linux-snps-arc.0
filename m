Return-Path: <SRS0=p2sK=6B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05D0C2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 22:44:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1F55214AF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 22:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P+Gk2sKR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1F55214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCPRiUBV/8hyGMguWwjCJsCmSn+Zwx/YAQj6p0RFmro=; b=P+Gk2sKRwxHBj7
	UefQM170aAdpFrmutxWhbDQZ9TpPMh2Upv8d8OaKJoMxZnzgSHTsPqRSTEhyGg+5Z4J3mSZvxjZ7W
	P/zzQ4ftfi5Ag4MzabFchXFyDRq6SbefsVdQksNVKt5c4Uc5MNYZ2Wa419MvOYQ9gpLimM/ta6tBt
	8xEbsHUWVwzZBrrNeMnvlJQ5tvH4uNcGRR4PP8xmSwnMqyzwx6S52kjticjdRQ+uQvGi+9+XhIWvl
	aF93PLNes0MoIefUYXnvGO7wRd2WbhDL6pCvfaP5c7QMJIwsUz8e1ab6Zu+g0OEeT0tLa4j88ZFND
	qwUPt4OuN+GnAoyvLc/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPZiY-0000MI-ST; Fri, 17 Apr 2020 22:44:14 +0000
Received: from esa4.mentor.iphmx.com ([68.232.137.252])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPZiV-0000Lq-Ap
 for linux-snps-arc@lists.infradead.org; Fri, 17 Apr 2020 22:44:13 +0000
IronPort-SDR: sfrpCimAGJpIWVnN0PqkarPslzkjvbVKnyKOw1QZfsIuYAM555x3Nfb8pI5xgIKg0kev6YhREj
 9FE8HvVOIkLYzBO76zXo3S9oHxxj+PBDNbclpFUXZ9gWZeRb/0af4aclq3HTjp0chJq2YcnRKd
 QehxImIiEP9dDp6EeXwFrFrKKEfq7rKg4OgTEV6MndYoP/AzNYYfMnDuhas7x6lttjOlG2UQ82
 yH6ecjJF66ZVebJ/g74nOgQrEYZ/CyqtDMYloT0gaxYAEiO6R11dlEFe2apJgP+JHTAQMf0u5O
 TsU=
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="47987225"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa4.mentor.iphmx.com with ESMTP; 17 Apr 2020 14:44:06 -0800
IronPort-SDR: 9Vlhw3+eQ6uQaEeXSlTIrcl/CH4HA05WNsH4aAYhsPhDfVBxi1ASQv+D8pxHeAEQPBcKGetowx
 q2wSvX2BBn0ELR+P5iOsjgYsW6xTD9VWsMe2YTvyVhcpTbki5ZZR7u6PDUld2uLSBCZgfDz4pL
 OrPeHpgePpfafgEy+OHpdBlWXJfGI0GgqdrTTuoShRvbgYLwojJ5WVJorOa06v/IIxub9roYFw
 PCw1be4p65RrVuPCFuXVr/bhVXI1x/xCz97qulyw+z7Kr0LHRoJcPo5Swth//ygiUfyp5W8S0h
 f0E=
Date: Fri, 17 Apr 2020 22:44:00 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v5 03/14] ARC: Thread Local Storage support
In-Reply-To: <20200409025615.27003-4-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2004172242490.1082@digraph.polyomino.org.uk>
References: <20200409025615.27003-1-vgupta@synopsys.com>
 <20200409025615.27003-4-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_154411_454881_D35C3C08 
X-CRM114-Status: UNSURE (   2.87  )
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

On Wed, 8 Apr 2020, Vineet Gupta via Libc-alpha wrote:

> +/* Code to initially initialize the thread pointer.  */
> +# define TLS_INIT_TP(tcbp)					\
> +  ({                                            		\
> +	long result_var;					\
> +	__builtin_set_thread_pointer(tcbp);     		\

Missing space before '(' in call to __builtin_set_thread_pointer.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
