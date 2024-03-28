Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A331EC54E64
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 Mar 2024 07:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3aDHrK9bAGFJO1ZzFmffyPJI9G3nylvYp1W76G+hJ4=; b=4BJsYCB3WhSC2Z
	a0z7/SP26SLmKji1up7K3yLcTSMRKhD9LJD4Dbv1LZ75w5Mjx7sauItIVo+dAGTpLlJgjSAomq4m6
	DlfAVHtSdpBGRielP52qOHDysUciMGxGWnhyQShyzri9gl6Kgke9NAKsXhabxTOHNQHCRJOMgHTmy
	ud04du3mAMD/QYfYQ3PLoNY4CoBzf1FiLATH8zVkZZPGeFnmsslInsDlA4GPSAl+IrV4S1H+3jo0f
	DOixfyo2oO5IWqBo71PWWEx30Pkj899X3u4ftLh5cnJj2ERQ1kvYiRapYKMsKMjXRB9X7a6zqxQoi
	bhL4FO0rzPgtpqE2l8jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpk8i-0000000CrND-0lmL;
	Thu, 28 Mar 2024 07:25:32 +0000
Received: from mailrelay6-1.pub.mailoutpod3-cph3.one.com ([46.30.211.245])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpk8Q-0000000CrGH-1y8O
	for linux-snps-arc@lists.infradead.org;
	Thu, 28 Mar 2024 07:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=gya7IPEuSu6MJQjEiIDquH7exohl6PUqhigJxnlATAE=;
	b=ZE4ko+rxCKWftwAo8NczSWsuqHjEGGfU6uUbSIvP9K7fRjmUyo4Xr6m3BNAQARjmG/LX8288MYqxa
	 qrdk8dPJqF9CYmvYKIuCC2KeC1KUOqccJBBkzOKfv28rtFurrRJni2BtWG1TH9wXZ4K99dnFf8V5MD
	 HZ1gA7bs8n86UELzO/3mtmm9tYEeJ1jNRSMFTH1fTc77A4UCALepeO491AxJF+4LLzM+MLxKLdACw9
	 4pMSRnDxAVYcWBUnWQrf3ZIk6pJCXrGR5H7uq2oOnDFOYI+oh/4/BJhyLEjVShZXd+FvQVzGTZFYI4
	 XSSV3BEarvEACwRvDNnbMC1B5JbFC8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=gya7IPEuSu6MJQjEiIDquH7exohl6PUqhigJxnlATAE=;
	b=F5ZG3jPwCujGHPqRnIkMdiF/ub3mtz9R1CndiSD3xivl8FAjmngZD0HN2Qu0BtwII0e2ZNTa1qmYb
	 0bYRExmAw==
X-HalOne-ID: 25d22949-ecd4-11ee-9cc7-bd80189f112a
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay6.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 25d22949-ecd4-11ee-9cc7-bd80189f112a;
	Thu, 28 Mar 2024 07:24:03 +0000 (UTC)
Date: Thu, 28 Mar 2024 08:24:01 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: arnd@arndb.de, javierm@redhat.com, deller@gmx.de,
	sui.jingfeng@linux.dev, linux-arch@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 1/3] arch: Select fbdev helpers with CONFIG_VIDEO
Message-ID: <20240328072401.GB1573630@ravnborg.org>
References: <20240327204450.14914-1-tzimmermann@suse.de>
 <20240327204450.14914-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240327204450.14914-2-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_002514_708583_FF525482 
X-CRM114-Status: GOOD (  11.94  )
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

On Wed, Mar 27, 2024 at 09:41:29PM +0100, Thomas Zimmermann wrote:
> Various Kconfig options selected the per-architecture helpers for
> fbdev. But none of the contained code depends on fbdev. Standardize
> on CONFIG_VIDEO, which will allow to add more general helpers for
> video functionality.
> 
> CONFIG_VIDEO protects each architecture's video/ directory. This
> allows for the use of more fine-grained control for each directory's
> files, such as the use of CONFIG_STI_CORE on parisc.
> 
> v2:
> - sparc: rebased onto Makefile changes
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
