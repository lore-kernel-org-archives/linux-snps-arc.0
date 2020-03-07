Return-Path: <SRS0=vrW9=4Y=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821F4C10DCE
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:16:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5492E206D7
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:16:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B5YtijRk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5492E206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wONkxcVXJUqo1ZhUCxbnLb2ZU8ps0+1fOO4DzTiA/AI=; b=B5YtijRk0qb7zi
	HYDBezi/dfrHG49xmDxAcNiGyOCoQ5D2oe5JBQa00QEWy8iyXgudgGGiP5KxR8JMXq4gCsD1aGrOs
	EcTlK/hEjOrxgn4l21IwhNbOHa/7bliwsaMDL0UOtcmrvTSenIroCROR7IZVJhsYrt6ViRCMzC2Be
	qRMGsq98e0vGfJCQ4Ru5GepTqGpH+w6TXivzJZyA+3lLe6i9GPnqwRls+r9z44Xi+q61lTRTeKOKo
	hcJIeBIluNRYMSOk65JVkWBthK79P7JUrIekmHsOJXPcTw51FVAUfEOllVRVYkwUZz9rdGa++Q3zy
	H5oMpFOEiMbeK36YOL4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAN8q-0006TK-LZ; Sat, 07 Mar 2020 00:16:32 +0000
Received: from esa3.mentor.iphmx.com ([68.232.137.180])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAN8l-0006Sp-NG
 for linux-snps-arc@lists.infradead.org; Sat, 07 Mar 2020 00:16:31 +0000
IronPort-SDR: 21n/XemHsmy296OX7diQrhbmbIOZshZXo/cpAlXWzv0GnbAEdNIeat/rm2xZqQSeaxos6iuq3l
 kBzDcmfnuXxdav1HB5NHPf5KTU9/lwMuyoSkD2CeOtMbdE6FF1IcxMUru7Au/CjRAS2OiWuUdd
 fH76iaQEFB1AuP2Pu2niprjcwXpVmE1jpxCG7uAFnytMDhBm2fJk9hscFUjy7cPHbLwQHRHAeX
 34wLN5jaBL/7N89ltAyUYpe9trxR+5GopFa0kqhXLH9jk8GhSBTUCTe0eMOLyiF2tesUBrluM+
 Qp0=
X-IronPort-AV: E=Sophos;i="5.70,524,1574150400"; d="scan'208";a="46512299"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 06 Mar 2020 16:16:27 -0800
IronPort-SDR: hDzF7pwIkhln4Hh3XCtjTmZcnnrdm0TZU28RqmmclOPlVs5QxcAI+ispeK0kAWYrxgr2D04xjR
 EJexzUEy6XJbGryTfzEtHV+d/oPcNQ4YhRMJROtrSk7sqHyfEzhWt5g0lyjiF96IIPXVJO8uEU
 KhzDyHOBI7x92VSax/CSRvhds3sB36UHiNwdaB7OqEPMDODkgtOi6F2g55aHJZoR6so2Xw3N/0
 BhN741ktL/jU+2KY2+lfCyyRu5+hNoYST9yjabjRT3+/a8MC89pSiZ3A9KEMgZuGw8Unw+RfcA
 GUs=
Date: Sat, 7 Mar 2020 00:16:21 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v3 14/17] ARC: Build Infrastructure
In-Reply-To: <20200306182419.13945-15-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003070015200.26274@digraph.polyomino.org.uk>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <20200306182419.13945-15-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_161627_792143_33897EE5 
X-CRM114-Status: UNSURE (   5.21  )
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

On Fri, 6 Mar 2020, Vineet Gupta wrote:

> diff --git a/sysdeps/unix/sysv/linux/arc/configure.ac b/sysdeps/unix/sysv/linux/arc/configure.ac
> new file mode 100644
> index 000000000000..a9528032d32a
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/configure.ac
> @@ -0,0 +1,4 @@
> +GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
> +# Local configure fragment for sysdeps/unix/sysv/linux/arc.
> +
> +arch_minimum_kernel=3.9.0

Surely you mean 5.1.0, at least until the glibc support for falling back 
to 32-bit time syscalls from 64-bit time interfaces is completed?

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
