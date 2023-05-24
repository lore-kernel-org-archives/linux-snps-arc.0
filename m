Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61250C7EE29
	for <linux-snps-arc@archiver.kernel.org>; Wed, 24 May 2023 00:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJxLAPO3IrErFlHr5uaTYZFavLJd6QM22bQLIwT6xUI=; b=YltQ4vgsazalb3
	KityIScWprDxSpxpA0lILoIYBpk+3p1+oRAegiKFDU5F0jKhLVgMvqovzNid/yqYplZ5EtSOA3T0B
	YIoUuX2+xvNPZlkz+WpI8DdQODTh/mDNsDhBD5x33LQIlzUaU9LE14t3Bq/agzXaKJX3tw+Va7HgJ
	mGCpO7pIMSapOkCcnc2Kw2g8degSogArv70ZDDcxVXfy6RSdtNqf+ScpHzJ8YkwZyNIWdYQmFk9Xn
	psRBKVhBfHXQma/ipq4MSU5CodwdOdNU0vreE32CHSzNt2Bs01pKSa4S699+yyJEqrLdtz0Pqmmoq
	q/KPEAoyoz6g3O6wLNSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1cNX-00Buke-0t;
	Wed, 24 May 2023 00:29:23 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1cNU-00BujC-1D
	for linux-snps-arc@lists.infradead.org;
	Wed, 24 May 2023 00:29:21 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1ae64580e9fso6785ad.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 23 May 2023 17:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684888159; x=1687480159;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p+iGDu91GXvHaUJ4/GkDIwXiVromlKTEDnrVX/jdHHE=;
        b=oCPd/VMBzehzBIwxKD0CUQlcv9XnCqSIGnZFpfNhT9159UiXp4+4s0dt1T5T+r2N8u
         ejdMVEW9GWrQK3u8D/R+OgCl4fi8an2VY0K+/eeCPWT2cGGSET/E3kHkr5iqimXeopNz
         1LhLEfNIl9101bv8HdubYyq2hpbrF89XLwyNahFvZOtnckCP7CoEZsh2L+2+OK9q9Yjc
         K9vC86dI9TWXu3/6r3ILFI/gvIY8hkiVXH1FcP052iNl13PiuUL4NAyi+n5JDzxUMMjc
         YVmWP+V4GT0WZnv89R5QJMFswFGyufptXG7L83ZUIfYIL/yWyXKcEjeZvi21gEBg088G
         o5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684888159; x=1687480159;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p+iGDu91GXvHaUJ4/GkDIwXiVromlKTEDnrVX/jdHHE=;
        b=hHla3R3pCzjYdFp9AY1BRB5HNY+N3ZnpY2CCs6XVG8Xq6blPDXAPDiGPy7U/bAB1S/
         KRb7zA/FaHXcRpNKWcUNCeZYQqGyxxH3UKVvGAUk3X0pagtot/z/VR3ZviEC6g26djqv
         bxMwblUv6vAFE7xmjxQ1wHw6tIDPoFPdlg3Tbb0oWLWuoXzRIopXY/v8cU7tXcIlfgI4
         Sd+6AIGRxloeWEqaUELp9i/VojwJDGbJTYWtGrUF9uhFtLz1OgFuFV3xsL2OGghRmfic
         134Kho/eaTZBridN+jqjNN97MYi/MB2/NipTTki1xs7CfQhpoEYWkGk9krQSXBxvVQyj
         ASZA==
X-Gm-Message-State: AC+VfDw/F5ssulwcs+q2k+sZG+S2xsT4684w5f0Q9UzDMrXPEc/zZLOQ
	XnRnQskkzLdCdvQabqNfwJuIwA==
X-Google-Smtp-Source: ACHHUZ4WC86fv/HCojVq6Z7bo1LnEN2P8Qa/JJdhSbqAvm7x1JKXoIG4BePTyVsmdwlyiuzkRQj4Vw==
X-Received: by 2002:a17:902:e847:b0:1af:90ce:5263 with SMTP id t7-20020a170902e84700b001af90ce5263mr107385plg.26.1684888158675;
        Tue, 23 May 2023 17:29:18 -0700 (PDT)
Received: from [2620:0:1008:11:c789:c1fb:6667:1766] ([2620:0:1008:11:c789:c1fb:6667:1766])
        by smtp.gmail.com with ESMTPSA id n20-20020a17090a929400b0024de0de6ec8sm137193pjo.17.2023.05.23.17.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 17:29:18 -0700 (PDT)
Date: Tue, 23 May 2023 17:29:17 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Vlastimil Babka <vbabka@suse.cz>
cc: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
    Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Hyeonggon Yoo <42.hyeyoo@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
    Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, 
    Andrew Lunn <andrew@lunn.ch>, 
    Gregory Clement <gregory.clement@bootlin.com>, 
    Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
    Tony Lindgren <tony@atomide.com>, Qin Jian <qinjian@cqplus1.com>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Dinh Nguyen <dinguyen@kernel.org>, 
    "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
    Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
    Rich Felker <dalias@libc.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    "David S . Miller" <davem@davemloft.net>, 
    Richard Weinberger <richard@nod.at>, 
    Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
    Johannes Berg <johannes@sipsolutions.net>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
    linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
    linux-tegra@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
    sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
    linux-mm@kvack.org
Subject: Re: [PATCH] mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED
In-Reply-To: <20230523091139.21449-1-vbabka@suse.cz>
Message-ID: <be109b49-8510-5887-72ae-738db9945619@google.com>
References: <20230523091139.21449-1-vbabka@suse.cz>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_172920_421281_55218229 
X-CRM114-Status: GOOD (  12.90  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, 23 May 2023, Vlastimil Babka wrote:

> As discussed at LSF/MM [1] [2] and with no objections raised there,
> deprecate the SLAB allocator. Rename the user-visible option so that
> users with CONFIG_SLAB=y get a new prompt with explanation during make
> oldconfig, while make olddefconfig will just switch to SLUB.
> 
> In all defconfigs with CONFIG_SLAB=y remove the line so those also
> switch to SLUB. Regressions due to the switch should be reported to
> linux-mm and slab maintainers.
> 
> [1] https://lore.kernel.org/all/4b9fc9c6-b48c-198f-5f80-811a44737e5f@suse.cz/
> [2] https://lwn.net/Articles/932201/
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: David Rientjes <rientjes@google.com>

The Kconfig option says that SLAB will be removed in a few cycles.  I 
think we should wait until at least the next LTS kernel is forked at the 
end of the year so that users who upgrade to only the LTS releases can be 
prompted for this change and surface any concerns.  Slab allocation is a 
critical subsystem, so I presume this is the safest and most responsible 
way to do the SLAB deprecation.  Hopefully that timeline works for 
everybody.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
