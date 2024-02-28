Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6846BC54E49
	for <linux-snps-arc@archiver.kernel.org>; Wed, 28 Feb 2024 11:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXzFmRw2JglXl27/xMuxpeUoUtlf1Ln/fMgFjWosXi8=; b=ILXCjGUdfNrk6L
	iyYhadakzl55OZCcosT7bLtwEtDYbilVGv6g8x9wkxxqUMQRjSTyf1eOdl6ziYiqvr3Ug0r6RspZ6
	gP+Rek+3jvJtoP2FwaIT1wypJsg5ndX3RVG+SJIsCoblUMVFCdpX0WoDx1GgA1WZdUvv3BlToWedf
	wRfg1bcqI7hRMnt1svKVYvkT5Bed3UBD4rU3DKkoD2C6rOfuCoi6RzQy72gYExj1kRflzyzGHbGTC
	0s54i/xs9oCYknLBAAMHe6Hk6xjUJLPCRLbUR8yefxqOp6PKwzfBGDfs6sMHSvogVLGjGST+7oAFx
	mVixTft2ZVpdbxZ8p81A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfIU0-000000097eF-2Qi5;
	Wed, 28 Feb 2024 11:52:20 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfITX-000000097T7-2Ie9;
	Wed, 28 Feb 2024 11:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709121112; x=1740657112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UOHYABj412OrOe9R32rHntZ5qCSK4fekgltl0v2LzuA=;
  b=RDBVhHu5kI9HOB61cYAalpnZ0DtwYx+LtAapZMdpmtTti1t1X1gju8nt
   c1z44b/MnstlsBpEtN+coKHYcUxG8szJs55fjXU147XR/FnOJV/SYvtx8
   yStpCZHQMUL+2+mNzijJUbKbYQR4frglhlbWn6aAz0h0GnpSTay4K1KiS
   IiGNHTgknp78ZyywcGudpjPoepr7mb7nd/n70LtFkTbbMhbgfZVWvX1UA
   lGV2Ev2plHj8OAZ9T2oYa2HMzAJbZll6mnn+lcU7iL97KTVsl4aQE99Cl
   dUNihqUkChd2VgIlYe1JlCnAkwnkgD2olR3z51GWrqQCwPsqgsW9sn4np
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="7337744"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7337744"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 03:51:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="937034059"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="937034059"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2024 03:51:44 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id B730928A; Wed, 28 Feb 2024 13:51:42 +0200 (EET)
Date: Wed, 28 Feb 2024 13:51:42 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, debug@rivosinc.com, 
	broonie@kernel.org, keescook@chromium.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, luto@kernel.org, 
	peterz@infradead.org, hpa@zytor.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Message-ID: <j7bfvig3gew3qruouxrh7z7ehjjafrgkbcmg6tcghhfh3rhmzi@wzlcoecgy5rs>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_035151_783923_9138C8E2 
X-CRM114-Status: GOOD (  15.35  )
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

On Mon, Feb 26, 2024 at 11:09:47AM -0800, Rick Edgecombe wrote:
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index 5db88b627439..dd6801bb9240 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -1218,7 +1218,7 @@ static unsigned long
>  arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
>  		         unsigned long limit)
>  {
> -	struct vm_unmapped_area_info info;
> +	struct vm_unmapped_area_info info = {};
>  
>  	info.flags = 0;
>  	info.length = len;

Can we make a step forward and actually move initialization inside the
initializator? Something like below.

I understand that it is substantially more work, but I think it is useful.

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 5db88b627439..c40ddede3b13 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1218,14 +1218,12 @@ static unsigned long
 arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
 		         unsigned long limit)
 {
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {
+		.length = len;
+		.low_limit = addr,
+		.high_limit = limit,
+	};

-	info.flags = 0;
-	info.length = len;
-	info.low_limit = addr;
-	info.high_limit = limit;
-	info.align_mask = 0;
-	info.align_offset = 0;
 	return vm_unmapped_area(&info);
 }

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
