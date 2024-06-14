Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F96C27C6E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Jun 2024 20:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IsUHqkU1MNRbktEz4ayFXJTQ/1/Woi4X8mMLYpsr5OQ=; b=wu7IeTxp/fEL1h
	ecitskD/g08kka6d6smj7z0BqbkODcCAqi2EXWm/+nMzPWPcomCoANe2232yWF437ig+St6cUmPqu
	auYpiD5V0R9iO6o+m900l27yJYOI3/MrSXXZTGpfpTc+FcVIqx10ZdQ8cGFx+cRf5mhnVTVM1SRmH
	KBL1utKfd2/pFPzm4yw5UWfM6rBZDfB8oJJFZ+6W4AFwLUuZZBbzx49TP4fqVIvZ3UTKXywDWKZvL
	H0+nK/87ulEzGKy6DbCyzBy8ixuzygDyiILrnU1cOhFY4MLd2mL0SCxcCL0AVIdprty/epStdyZqB
	3omPwj4QRgrWwzNaelbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIDEh-00000003x5g-18BV;
	Fri, 14 Jun 2024 20:09:23 +0000
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIDEf-00000003x5E-0ql1;
	Fri, 14 Jun 2024 20:09:21 +0000
Message-ID: <e459e0eb-40a7-406b-b5d4-cfd937796177@infradead.org>
Date: Fri, 14 Jun 2024 13:09:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: Remove unused "nps_mtm_hs_ctr" from
 kernel-parameters.txt
To: Thomas Huth <thuth@redhat.com>, linux-doc@vger.kernel.org,
 Vineet Gupta <vgupta@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-snps-arc@lists.infradead.org
References: <20240614190804.602970-1-thuth@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240614190804.602970-1-thuth@redhat.com>
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



On 6/14/24 12:08 PM, Thomas Huth wrote:
> The "nps_mtm_hs_ctr" parameter has been removed in commit dd7c7ab01a04
> ("ARC: [plat-eznps]: Drop support for EZChip NPS platform"). Remove it
> from the documentation now, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.


> ---
>  Documentation/admin-guide/kernel-parameters.txt | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index dd8436c98735..f58001338860 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4143,15 +4143,6 @@
>  			parameter, xsave area per process might occupy more
>  			memory on xsaves enabled systems.
>  
> -	nps_mtm_hs_ctr=	[KNL,ARC]
> -			This parameter sets the maximum duration, in
> -			cycles, each HW thread of the CTOP can run
> -			without interruptions, before HW switches it.
> -			The actual maximum duration is 16 times this
> -			parameter's value.
> -			Format: integer between 1 and 255
> -			Default: 255
> -
>  	nptcg=		[IA-64] Override max number of concurrent global TLB
>  			purges which is reported from either PAL_VM_SUMMARY or
>  			SAL PALO.

-- 
~Randy

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
