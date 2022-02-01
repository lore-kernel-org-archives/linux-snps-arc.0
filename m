Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E4AC433FE
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Feb 2022 15:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dwrsw9dCjiQtHfvmar7WmmtGLrplYQrOZAO5uyHLAtU=; b=IEj9WpIgAfE7PY
	cgnhMRTdvJje5OJphTb8djXkdDOfUQccGKUtGxpNoG//f1fw9k2N90uhW0uwTtXSbc9DFTlbPtBvf
	YSI9CSeFGTX+uqAUiwjIpXpppI43oDMuvLYqT2X40sLN6BQR8EYeZzeUlRLc3FH6cy7a4qvtOi4Gm
	nwdTSN7JQ6hQ+hcDbecQJaCqseWkGLb1v+DcMpQynysA/NjS7/m0rhXvkexH3cWFEn+rxDEefosbK
	CpCEWLNhEZVcX0qyAu7UhwbgRHHXnRhRCa3uWtLFkvxe/wKto7DhFBMw1zmjHBJjdGBp15cQ0U+4J
	VwlCnOblOz9o6gwxSA4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEv2P-00Cf51-5h; Tue, 01 Feb 2022 15:25:45 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEunf-00CY6G-Py
 for linux-snps-arc@lists.infradead.org; Tue, 01 Feb 2022 15:10:33 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 60EE267373; Tue,  1 Feb 2022 16:10:28 +0100 (CET)
Date: Tue, 1 Feb 2022 16:10:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-snps-arc@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>,
 Vladimir Isaev <isaev@synopsys.com>, Christoph Hellwig <hch@lst.de>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: Re: [RFC PATCH 2/3] arc: provide __{get,put}_kernel_nofault
Message-ID: <20220201151028.GB3731@lst.de>
References: <20220201145538.111192-1-geomatsi@gmail.com>
 <20220201145538.111192-3-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220201145538.111192-3-geomatsi@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_071032_039110_1CD240F8 
X-CRM114-Status: GOOD (  15.94  )
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

On Tue, Feb 01, 2022 at 05:55:37PM +0300, Sergey Matyukevich wrote:
> From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
> 
> Implement the non-faulting kernel access helpers directly
> instead of using uaccess routines under set_fs(KERNEL_DS).
> 
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
> ---
>  arch/arc/include/asm/uaccess.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arc/include/asm/uaccess.h b/arch/arc/include/asm/uaccess.h
> index 9d1205bf90f1..c14b692a0a4e 100644
> --- a/arch/arc/include/asm/uaccess.h
> +++ b/arch/arc/include/asm/uaccess.h
> @@ -657,6 +657,28 @@ static inline unsigned long __arc_clear_user(void __user *to, unsigned long n)
>  	return res;
>  }
>  
> +#define HAVE_GET_KERNEL_NOFAULT
> +
> +#define __get_kernel_nofault(dst, src, type, err_label)			\
> +	do {								\

Normal kernel style doesn't indent the do { } while inside of
function-like macros.

Otherwise this looks good.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
