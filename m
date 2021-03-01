Return-Path: <SRS0=cqGV=H7=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAEAC433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Mar 2021 08:54:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61A0264DE0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Mar 2021 08:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61A0264DE0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=idosch.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nb2KQqwVpaaqjNWdOw9oIr6gjuIagqBk9s57WAilPYM=; b=P/+S3F9nvXjVr8cgz4wPWjy3O
	QB/VIHydkGvWmSuFkTzytO5NuXjojJpWhmBa7k5cg+8vgt1kwbPuzCVnPI3h/1xdricScKZHb4VRl
	NSnSgrAsGirkF+nkMB+dDk3SCrxGVjWcdMFNDbSFj9LaB8+Ba7NM600h3w+H5Oa5ClKsmQiGLEuZA
	VYOvlg8qTLfzo9xyJFZ84wtW1f+NC1zy7LapzxCriVRbXR1qCppGmLdjBxDpGL8Zi7IbCj8pFVki5
	/D0nbYrlyw030NlnG9S9m8GS2hwqxw3S4PqVlZdfoCS3bOSu0oGLu/lP6ECkSnujbVk6xb90XaraC
	zvDxoYXIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGeKC-0003BS-G8; Mon, 01 Mar 2021 08:54:44 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGeKA-0003Ad-8m
 for linux-snps-arc@lists.infradead.org; Mon, 01 Mar 2021 08:54:42 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9C836580221;
 Mon,  1 Mar 2021 03:54:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 01 Mar 2021 03:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2wvNQI
 WBpBOZWpWbefbd33FSrA5QpP7DmdH/BxqyZQE=; b=nve+oeJBo2TDkIH/qMAahu
 QSly78fe6d9N7PH1CzszhHH2vdxjGw6EMkIII9WJPhanmPpuqpfVgI4/Uz7iyxpY
 rXTffOVZxkqTkN4GXLR4n81li451mocOmn7QtkRsUMziY6GTfcyDrLt2NnzKqDgq
 qMHzxvMT6ew+4T5kJ75BuH2M5HfiiI8cGoeoSt4JpL/aoRXHwcFsrpHgnSdsQMm0
 dgXHPnIm4bM08GzxZSPLtoiCqhW8NXKVuylAz72q7iRVQXp2JRSVl50sXT8vCxI+
 kxkBBH8/99L3pqnYt3RxRQHlDJHkhIcN4dIRx7lMBDex/CerNPsThav6vyRuXP0Q
 ==
X-ME-Sender: <xms:zKs8YEHC2wXN5ZRCbSeNIye4UN6JQO1z2li1bV3he1BqaphSJAQM3w>
 <xme:zKs8YBkRKQIsyVh6mJnVXVKCUeOCpDcWmuuxl7ejRme_0Rd1dJsiuf_XdDKTO9wbU
 11mHpMvdh65GIU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleejgdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefkughoucfu
 tghhihhmmhgvlhcuoehiughoshgthhesihguohhstghhrdhorhhgqeenucggtffrrghtth
 gvrhhnpedtffekkeefudffveegueejffejhfetgfeuuefgvedtieehudeuueekhfduheel
 teenucfkphepkeegrddvvdelrdduheefrdeggeenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehiughoshgthhesihguohhstghhrdhorhhg
X-ME-Proxy: <xmx:zKs8YJKqjwOdEj7Dkkg0t1GLl1U5eypDAPZTgZ38TADIZ0P_9GFWOg>
 <xmx:zKs8YKbVAYHma4UbKk2rfNR-kpoz1Or260y8OgWIF6qQGnJ-Rkw2qg>
 <xmx:zKs8YDa7VlXZg-bRpWaaC26PewimtSJXzDiA4YM6qsS01YKQWoEsQw>
 <xmx:zas8YEiuDtDMWLYQMX3IpUOQXDef9IY3KhjhRdDkFgFtok12_yinhg>
Received: from localhost (igld-84-229-153-44.inter.net.il [84.229.153.44])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7403B24005E;
 Mon,  1 Mar 2021 03:54:36 -0500 (EST)
Date: Mon, 1 Mar 2021 10:54:32 +0200
From: Ido Schimmel <idosch@idosch.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH 10/11] pragma once: delete few backslashes
Message-ID: <YDyryN/GOj9JXFm+@shredder.lan>
References: <YDvLYzsGu+l1pQ2y@localhost.localdomain>
 <YDvNSg9OPv7JqfRS@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDvNSg9OPv7JqfRS@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_035442_338303_E1529C3D 
X-CRM114-Status: UNSURE (   8.33  )
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
Cc: Jason@zx2c4.com, mchehab@kernel.org, vgupta@synopsys.com, idosch@nvidia.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, jiri@nvidia.com,
 akpm@linux-foundation.org, linux-snps-arc@lists.infradead.org,
 torvalds@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sun, Feb 28, 2021 at 08:05:14PM +0300, Alexey Dobriyan wrote:
> From 251ca5673886b5bb0a42004944290b9d2b267a4a Mon Sep 17 00:00:00 2001
> From: Alexey Dobriyan <adobriyan@gmail.com>
> Date: Fri, 19 Feb 2021 13:37:24 +0300
> Subject: [PATCH 10/11] pragma once: delete few backslashes
> 
> Some macros contain one backslash too many and end up being the last
> macro in a header file. When #pragma once conversion script truncates
> the last #endif and whitespace before it, such backslash triggers
> a warning about "OMG file ends up in a backslash-newline".
> 
> Needless to say I don't want to handle another case in my script,
> so delete useless backslashes instead.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>

For mlxsw:

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Tested-by: Ido Schimmel <idosch@nvidia.com>

Thanks

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
