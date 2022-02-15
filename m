Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60420C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Feb 2022 21:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TB9PLeBL4ii1OKDHU9/waOI7w5EBbmYo5Tkx9QElLzI=; b=UNyZdiTz2PpitX
	td8c83HNBUUzK64t1iLKN1VI5bPKytn3gyzgQXnBqWNQsOcW5uSvOvnaIsQb4hfONQCOE7jUyg17Q
	FDopV+MX7BXMHmGjIIO2Rlpqks6wSQd6miCg3F5eZ8pp1PncsxOJ9HsVFSs6Vq08I0uCOSN26pgvD
	u1ebD5G9Io/YREep/aK0mCv7/X7ioIZTIQ7xtJEyAVpQ/g+u0oPoguP++DrIZ2Wh6qGqyh4Mxgib8
	pxlRWiLsvV6a6iv1GeJEQ9N9JFLnuQLHWC1em+EHCdoJlTrOJnSAGJORUE6D2oO02v4A3d/H9cQmM
	OJbj/ZtsNrIvLC9Xsdtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK4zq-004dPZ-HL; Tue, 15 Feb 2022 21:04:26 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK4zm-004dNl-TA
 for linux-snps-arc@lists.infradead.org; Tue, 15 Feb 2022 21:04:24 +0000
Received: by mail-lf1-x134.google.com with SMTP id j15so16396934lfe.11
 for <linux-snps-arc@lists.infradead.org>; Tue, 15 Feb 2022 13:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8QmcLGS5Ay05Fpb9lK3qT0dXgSZFy5u7Z8YTc2SYfS8=;
 b=ES7z827OvThl7UVsC6zLz9b65IgayNUrq/GVQF+Xtq4BFRanPPB7iY5uUiw/1xtHJ9
 yPfvV+5D93CM0q6Df7ZevxdWo95u/YdJkZjl8Q2/n+REPbjWlQgfgC7O7QqhgJ601Xvr
 M3ht5UQJt064p1lQtMZE/2bwm5EjlcpZKrhShFEE0OxMpieiBFZSXEuud6TcZcgMVuZ1
 Qh3xpAAV1obY2lCWjp/HzT1jXxWV5k+wyVCsiVngHOoIGyShAgniTPjttY/PeohEk+8b
 /8DZ+12maBmpr3y18pe/2ZmrJMx3FJHbESjhs/15bZCytIW2rYLGVcP8UHHaHIBkQ3Nm
 GTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8QmcLGS5Ay05Fpb9lK3qT0dXgSZFy5u7Z8YTc2SYfS8=;
 b=fY8nkhpYSEfswqP1BHoQJSq9K7vLJJOYTZ4amg7NkAT/lcMXUzHMdT+AhsCosE7XQO
 19NcFdYL9LYLaYw5Mx/KjW+hUmdPijNO2KMX9ui96b7wxbfNaAXVOl3Eyi6rjJu8YOHE
 cFUo0IwwQfq4utm0DwC93XEd6GrcVkaY2rXqZH0axlia4Uv7FAKOGTUoBkoVSbMMGngU
 KGdiioe5Tn1GVSPnMRkLkywjfEr+TldzLXnnIFKCFh/vbO5c6+rWFQNA96RdSo0z1kDO
 QTM5kQHGEI3X8TRMXiBbYidMAG8EGImOZC5wKvcVBwTwx0sX27zzgBv18EC/AzlmI+DT
 8NmQ==
X-Gm-Message-State: AOAM531o4DRLuXyVe7y12tv0DDnLqs41nF+EwAN86BzHwvo5+muBm51+
 OLkEDeQE/FO5DYd5aDDxqxM=
X-Google-Smtp-Source: ABdhPJwbPQGXw3+ak4gXhtgy/ZZctyfMvLaf5jfTQO2sjmecaDxF/rlJakn5EMW+AR4kfVQJk1gMkA==
X-Received: by 2002:a05:6512:104c:: with SMTP id
 c12mr699536lfb.418.1644959059887; 
 Tue, 15 Feb 2022 13:04:19 -0800 (PST)
Received: from curiosity ([5.188.167.245])
 by smtp.gmail.com with ESMTPSA id s10sm4654757lfb.291.2022.02.15.13.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 13:04:19 -0800 (PST)
Date: Wed, 16 Feb 2022 00:04:18 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, Vladimir Isaev <isaev@synopsys.com>,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH 0/3] arc: remove CONFIG_SET_FS
Message-ID: <YgwVUmMlASsW7mSd@curiosity>
References: <20220201145538.111192-1-geomatsi@gmail.com>
 <f0f5d195-cddc-3a8f-3503-bb1fa602a2b6@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0f5d195-cddc-3a8f-3503-bb1fa602a2b6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_130422_966958_8B8C3DE5 
X-CRM114-Status: GOOD (  14.36  )
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

Hi Vineet,

> > Hi all,
> > 
> > This patch series removes SET_FS support for arc.
> > 
> > Sergey Matyukevich (3):
> >    arc: use BUILD_BUG for invalid sizes in get_user/put_user
> >    arc: provide __{get,put}_kernel_nofault
> >    arc: remove set_fs()
> > 
> >   arch/arc/Kconfig                   |  1 -
> >   arch/arc/include/asm/segment.h     | 20 -------------
> >   arch/arc/include/asm/thread_info.h |  3 --
> >   arch/arc/include/asm/uaccess.h     | 48 ++++++++++++++++++++----------
> >   4 files changed, 32 insertions(+), 40 deletions(-)
> >   delete mode 100644 arch/arc/include/asm/segment.h
> 
> Nit - in future please use uppercase "ARC" for prefixing patches.
> 
> Added to for-next.

IIUC it makes sense to drop this patch series from your for-next branch.
These changes have been superseded by generic approach posted by
Arnd Bergmann, see:
https://lore.kernel.org/linux-arch/CAHk-=whXYWoP6of7js=f4zov62on97mNFRSVRWhY75WoGM6CoQ@mail.gmail.com/T/#t

I tested patches by Arnd on ARC700/ARCHS platforms, so far so good.

Regards,
Sergey

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
